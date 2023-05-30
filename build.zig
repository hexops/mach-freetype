const std = @import("std");
const Build = std.Build;

const root_source_path = "src/main.zig";

pub fn build(b: *Build) !void {
    const optimize = b.standardOptimizeOption(.{});
    const target = b.standardTargetOptions(.{});

    const freetype_brotli = b.option(bool, "freetype_brotli", "Use brotli for freetype") orelse false;
    const ft_dep = b.dependency("freetype", .{
        .optimize = optimize,
        .target = target,
        .brotli = freetype_brotli,
    });

    const hb_dep = b.dependency("harfbuzz", .{
        .optimize = optimize,
        .target = target,
        // FIXME: Wait for nicer options in Zig package manager
        .freetype_brotli = freetype_brotli,
        .freetype = true,
    });

    const font_assets_mod = b.dependency("font_assets", .{}).module("font_assets"); // font_assets

    const mod = b.addModule("mach-freetype", .{
        .source_file = .{ .path = root_source_path },
    });

    const test_exe = b.addTest(.{
        .root_source_file = .{ .path = root_source_path },
        .optimize = optimize,
        .target = target,
    });

    test_exe.linkLibC();
    test_exe.linkLibrary(ft_dep.artifact("freetype"));
    test_exe.linkLibrary(hb_dep.artifact("harfbuzz"));
    test_exe.addModule("font_assets", font_assets_mod);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&b.addRunArtifact(test_exe).step);

    inline for ([_][]const u8{
        "single-glyph",
        "glyph-to-svg",
    }) |example| {
        const example_exe = b.addExecutable(.{
            .name = "example-" ++ example,
            .root_source_file = .{ .path = "examples/" ++ example ++ ".zig" },
            .target = target,
            .optimize = optimize,
        });
        example_exe.addModule("freetype", mod);

        example_exe.linkLibC();
        example_exe.linkLibrary(ft_dep.artifact("freetype"));
        example_exe.linkLibrary(hb_dep.artifact("harfbuzz"));
        example_exe.addModule("font_assets", font_assets_mod);

        const example_install = b.addInstallArtifact(example_exe);

        var example_compile_step = b.step("example-" ++ example, "Compile '" ++ example ++ "' example");
        example_compile_step.dependOn(&example_install.step);

        const example_run_cmd = b.addRunArtifact(example_exe);
        if (b.args) |args| {
            example_run_cmd.addArgs(args);
        }

        const example_run_step = b.step("run-example-" ++ example, "Run '" ++ example ++ "' example");
        example_run_step.dependOn(&example_run_cmd.step);
    }
}
