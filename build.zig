const std = @import("std");

pub var brotli_import_path: []const u8 = "brotli";
pub var freetype_import_path: []const u8 = "freetype";

pub fn build(b: *std.Build) !void {
    const optimize = b.standardOptimizeOption(.{});
    const target = b.standardTargetOptions(.{});
    const use_system_zlib = b.option(bool, "use_system_zlib", "Use system zlib") orelse false;
    const enable_brotli = b.option(bool, "enable_brotli", "Build brotli") orelse true;

    const freetype_module = b.addModule("mach-freetype", .{ .source_file = .{ .path = "src/freetype.zig" } });
    const harfbuzz_module = b.addModule("mach-harfbuzz", .{
        .source_file = .{ .path = "src/harfbuzz.zig" },
        .dependencies = &.{.{ .name = "freetype", .module = freetype_module }},
    });
    _ = harfbuzz_module;

    // TODO: uncomment all this code once hexops/mach#902 is fixed, b.dependency("harfbuzz") cannot
    // be called inside `pub fn build` if we want this package to be usable via the package manager.
    _ = optimize;
    _ = target;
    _ = use_system_zlib;
    _ = enable_brotli;

    // const freetype_dep = b.dependency("freetype", .{
    //     .optimize = optimize,
    //     .target = target,
    //     .use_system_zlib = use_system_zlib,
    //     .enable_brotli = enable_brotli,
    // });
    // _ = freetype_dep;
    // const harfbuzz_dep = b.dependency("harfbuzz", .{
    //     .optimize = optimize,
    //     .target = target,
    //     .enable_freetype = true,
    //     .freetype_use_system_zlib = use_system_zlib,
    //     .freetype_enable_brotli = enable_brotli,
    // });
    // _ = harfbuzz_dep;
    // const font_assets_dep = b.dependency("font_assets", .{});

    // const freetype_tests = b.addTest(.{
    //     .name = "freetype-tests",
    //     .root_source_file = .{ .path = "src/freetype.zig" },
    //     .target = target,
    //     .optimize = optimize,
    // });
    // freetype_tests.addModule("font-assets", font_assets_dep.module("font-assets"));
    // linkFreetype(b, optimize, target, freetype_tests);

    // const harfbuzz_tests = b.addTest(.{
    //     .name = "harfbuzz-tests",
    //     .root_source_file = .{ .path = "src/harfbuzz.zig" },
    //     .target = target,
    //     .optimize = optimize,
    // });
    // harfbuzz_tests.addModule("freetype", freetype_module);
    // linkFreetype(b, optimize, target, harfbuzz_tests);
    // linkHarfbuzz(b, optimize, target, harfbuzz_tests);

    // const test_step = b.step("test", "Run library tests");
    // test_step.dependOn(&b.addRunArtifact(freetype_tests).step);
    // test_step.dependOn(&b.addRunArtifact(harfbuzz_tests).step);

    // inline for ([_][]const u8{
    //     "single-glyph",
    //     "glyph-to-svg",
    // }) |example| {
    //     const example_exe = b.addExecutable(.{
    //         .name = example,
    //         .root_source_file = .{ .path = "examples/" ++ example ++ ".zig" },
    //         .target = target,
    //         .optimize = optimize,
    //     });
    //     example_exe.addModule("font-assets", font_assets_dep.module("font-assets"));
    //     example_exe.addModule("freetype", freetype_module);
    //     linkFreetype(b, optimize, target, example_exe);
    //     linkHarfbuzz(b, optimize, target, example_exe);

    //     const example_run_cmd = b.addRunArtifact(example_exe);
    //     if (b.args) |args| example_run_cmd.addArgs(args);

    //     const example_run_step = b.step("run-" ++ example, "Run '" ++ example ++ "' example");
    //     example_run_step.dependOn(&example_run_cmd.step);
    // }
}

pub fn linkFreetype(
    b: *std.Build,
    optimize: std.builtin.OptimizeMode,
    target: std.zig.CrossTarget,
    step: *std.build.CompileStep,
) void {
    @import("freetype").brotli_import_path = brotli_import_path;
    step.linkLibrary(@import("freetype").lib(b, optimize, target));
    @import("freetype").addPaths(step);
}

pub fn linkHarfbuzz(
    b: *std.Build,
    optimize: std.builtin.OptimizeMode,
    target: std.zig.CrossTarget,
    step: *std.build.CompileStep,
) void {
    @import("harfbuzz").freetype_import_path = freetype_import_path;
    step.linkLibrary(@import("harfbuzz").lib(b, optimize, target));
    @import("harfbuzz").addPaths(step);
}
