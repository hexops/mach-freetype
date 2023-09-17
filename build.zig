const std = @import("std");

pub fn build(b: *std.Build) !void {
    const optimize = b.standardOptimizeOption(.{});
    const target = b.standardTargetOptions(.{});
    const use_system_zlib = b.option(bool, "use_system_zlib", "Use system zlib") orelse false;
    _ = use_system_zlib;
    const enable_brotli = b.option(bool, "enable_brotli", "Build brotli") orelse true;
    _ = enable_brotli;

    const freetype_module = b.addModule("mach-freetype", .{ .source_file = .{ .path = "src/freetype.zig" } });
    const harfbuzz_module = b.addModule("mach-harfbuzz", .{
        .source_file = .{ .path = "src/harfbuzz.zig" },
        .dependencies = &.{.{ .name = "freetype", .module = freetype_module }},
    });
    _ = harfbuzz_module;

    const font_assets_dep = b.dependency("font_assets", .{});

    const freetype_tests = b.addTest(.{
        .name = "freetype-tests",
        .root_source_file = .{ .path = "src/freetype.zig" },
        .target = target,
        .optimize = optimize,
    });
    freetype_tests.addModule("font-assets", font_assets_dep.module("font-assets"));
    linkFreetype(b, freetype_tests);

    const harfbuzz_tests = b.addTest(.{
        .name = "harfbuzz-tests",
        .root_source_file = .{ .path = "src/harfbuzz.zig" },
        .target = target,
        .optimize = optimize,
    });
    harfbuzz_tests.addModule("freetype", freetype_module);
    linkFreetype(b, harfbuzz_tests);
    linkHarfbuzz(b, harfbuzz_tests);

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
        example_exe.addModule("font-assets", font_assets_dep.module("font-assets"));
        example_exe.addModule("freetype", freetype_module);
        linkFreetype(b, example_exe);
        linkHarfbuzz(b, example_exe);

        const example_run_cmd = b.addRunArtifact(example_exe);
        if (b.args) |args| example_run_cmd.addArgs(args);

        const example_run_step = b.step("run-" ++ example, "Run '" ++ example ++ "' example");
        example_run_step.dependOn(&example_run_cmd.step);
    }
}

pub fn linkFreetype(
    b: *std.Build,
    step: *std.build.CompileStep,
) void {
    step.linkLibrary(b.dependency("freetype", .{
        .target = step.target,
        .optimize = step.optimize,
    }).artifact("freetype"));
}

pub fn linkHarfbuzz(
    b: *std.Build,
    step: *std.build.CompileStep,
) void {
    step.linkLibrary(b.dependency("harfbuzz", .{
        .target = step.target,
        .optimize = step.optimize,
    }).artifact("harfbuzz"));
}
