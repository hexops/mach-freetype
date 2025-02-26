const std = @import("std");

pub fn build(b: *std.Build) !void {
    const optimize = b.standardOptimizeOption(.{});
    const target = b.standardTargetOptions(.{});
    const use_system_zlib = b.option(bool, "use_system_zlib", "Use system zlib") orelse false;
    const enable_brotli = b.option(bool, "enable_brotli", "Build brotli") orelse true;
    const enable_ot_svg = b.option(bool, "enable_ot_svg", "enable OpenType SVG") orelse false;

    const build_options = b.addOptions();
    build_options.addOption(bool, "enable_ot_svg", enable_ot_svg);

    const freetype_module = b.addModule("mach-freetype", .{
        .root_source_file = b.path("src/freetype.zig"),
    });
    const harfbuzz_module = b.addModule("mach-harfbuzz", .{
        .root_source_file = b.path("src/harfbuzz.zig"),
        .imports = &.{.{ .name = "freetype", .module = freetype_module }},
    });
    freetype_module.addImport("build-options", build_options.createModule());

    const freetype_tests = b.addTest(.{
        .name = "freetype-tests",
        .root_source_file = b.path("src/freetype.zig"),
        .target = target,
        .optimize = optimize,
    });
    freetype_tests.root_module.addImport("freetype", freetype_module);

    const harfbuzz_tests = b.addTest(.{
        .name = "harfbuzz-tests",
        .root_source_file = b.path("src/harfbuzz.zig"),
        .target = target,
        .optimize = optimize,
    });
    harfbuzz_tests.root_module.addImport("freetype", freetype_module);
    harfbuzz_tests.root_module.addImport("harfbuzz", harfbuzz_module);

    if (b.lazyDependency("font_assets", .{})) |dep| {
        freetype_tests.root_module.addImport("font-assets", dep.module("font-assets"));
    }
    if (b.lazyDependency("freetype", .{
        .target = target,
        .optimize = optimize,
        .use_system_zlib = use_system_zlib,
        .enable_brotli = enable_brotli,
    })) |dep| {
        freetype_tests.root_module.linkLibrary(dep.artifact("freetype"));
        freetype_module.linkLibrary(dep.artifact("freetype"));
        harfbuzz_module.linkLibrary(dep.artifact("freetype"));
        harfbuzz_tests.root_module.linkLibrary(dep.artifact("freetype"));
    }
    if (b.lazyDependency("harfbuzz", .{
        .target = target,
        .optimize = optimize,
        .enable_freetype = true,
        .freetype_use_system_zlib = use_system_zlib,
        .freetype_enable_brotli = enable_brotli,
    })) |dep| {
        harfbuzz_module.linkLibrary(dep.artifact("harfbuzz"));
        harfbuzz_tests.root_module.linkLibrary(dep.artifact("harfbuzz"));
    }

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&b.addRunArtifact(freetype_tests).step);
    test_step.dependOn(&b.addRunArtifact(harfbuzz_tests).step);

    inline for ([_][]const u8{
        "single-glyph",
        "glyph-to-svg",
    }) |example| {
        const example_exe = b.addExecutable(.{
            .name = example,
            .root_source_file = b.path("examples/" ++ example ++ ".zig"),
            .target = target,
            .optimize = optimize,
        });
        example_exe.root_module.addImport("freetype", freetype_module);
        if (b.lazyDependency("font_assets", .{})) |dep| {
            example_exe.root_module.addImport("font-assets", dep.module("font-assets"));
        }

        const example_run_cmd = b.addRunArtifact(example_exe);
        if (b.args) |args| example_run_cmd.addArgs(args);

        const example_run_step = b.step("run-" ++ example, "Run '" ++ example ++ "' example");
        example_run_step.dependOn(&example_run_cmd.step);
    }
}
