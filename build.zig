const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const icons_dep = b.dependency("icons", .{
        .target = target,
        .optimize = optimize,
    });

    const dvui_dep = b.dependency("dvui", .{
        .target = target,
        .optimize = optimize,
        .tvg = true,
    });

    _ = b.addModule("dvui_kit", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
        .imports = &.{
            .{ .name = "icons", .module = icons_dep.module("icons") },
            .{ .name = "dvui", .module = dvui_dep.module("dvui_sdl3") },
        },
    });
}
