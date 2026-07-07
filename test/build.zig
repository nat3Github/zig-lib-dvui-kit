const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const dvui_dep = b.dependency("dvui", .{
        .target = target,
        .optimize = optimize,
        .backend = .sdl3,
    });
    const dvui_mod = dvui_dep.module("dvui_sdl3");
    const sdl3_mod = dvui_dep.module("sdl3");

    const kit_dep = b.dependency("dvui_kit", .{
        .target = target,
        .optimize = optimize,
    });
    const kit_mod = kit_dep.module("dvui_kit");
    kit_mod.addImport("dvui", dvui_mod);

    const exe = b.addExecutable(.{
        .name = "showcase",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "dvui", .module = dvui_mod },
                .{ .name = "dvui_kit", .module = kit_mod },
                .{ .name = "sdl3", .module = sdl3_mod },
            },
        }),
    });

    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    const run_step = b.step("run", "Run the showcase app");
    run_step.dependOn(&run_cmd.step);
}
