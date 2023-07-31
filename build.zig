const std = @import("std");

pub fn build(b: *std.Build) !void {
    const optimize = b.standardOptimizeOption(.{});
    const target = b.standardTargetOptions(.{});
    const use_system_zlib = b.option(bool, "use_system_zlib", "Use system zlib") orelse false;
    const enable_brotli = b.option(bool, "enable_brotli", "Build brotli") orelse false;

    const freetype_module = b.addModule("mach-freetype", .{ .source_file = .{ .path = "src/main.zig" } });
    const harfbuzz_module = b.addModule("mach-harfbuzz", .{
        .source_file = .{ .path = "src/harfbuzz/main.zig" },
        .dependencies = &.{.{ .name = "freetype", .module = freetype_module }},
    });
    _ = harfbuzz_module;

    const harfbuzz_dep = b.dependency("harfbuzz", .{
        .optimize = optimize,
        .target = target,
        .enable_freetype = true,
        .freetype_use_system_zlib = use_system_zlib,
        .freetype_enable_brotli = enable_brotli,
    });
    const font_assets_dep = b.dependency("font_assets", .{});

    const freetype_tests = b.addTest(.{
        .name = "freetype-tests",
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });
    freetype_tests.addModule("font-assets", font_assets_dep.module("font-assets"));
    freetype_tests.linkLibrary(harfbuzz_dep.artifact("harfbuzz"));

    const harfbuzz_tests = b.addTest(.{
        .name = "harfbuzz-tests",
        .root_source_file = .{ .path = "src/harfbuzz/main.zig" },
        .target = target,
        .optimize = optimize,
    });
    harfbuzz_tests.addModule("freetype", freetype_module);
    harfbuzz_tests.linkLibrary(harfbuzz_dep.artifact("harfbuzz"));

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&b.addRunArtifact(freetype_tests).step);
    test_step.dependOn(&b.addRunArtifact(harfbuzz_tests).step);

    inline for ([_][]const u8{
        "single-glyph",
        "glyph-to-svg",
    }) |example| {
        const example_exe = b.addExecutable(.{
            .name = example,
            .root_source_file = .{ .path = "examples/" ++ example ++ ".zig" },
            .target = target,
            .optimize = optimize,
        });
        example_exe.addModule("freetype", freetype_module);
        example_exe.addModule("font-assets", font_assets_dep.module("font-assets"));
        example_exe.linkLibrary(harfbuzz_dep.artifact("harfbuzz"));

        const example_run_cmd = b.addRunArtifact(example_exe);
        if (b.args) |args| example_run_cmd.addArgs(args);

        const example_run_step = b.step("run-" ++ example, "Run '" ++ example ++ "' example");
        example_run_step.dependOn(&example_run_cmd.step);
    }
}
