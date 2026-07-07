# lib-dvui-kit

A small kit of ready-to-use assets for [dvui](https://github.com/david-vanderson/dvui):

- `icons` — reexport of [zig-lib-icons](https://github.com/nat3Github/zig-lib-icons) (feather, lucide, heroicons, entypo, ... as TVG data).
- `tailwind` — [Tailwind CSS v4](https://tailwindcss.com/docs/colors) color hex codes, vendored (not a dependency, source is tiny).
- `theme` — the same Tailwind colors converted to `dvui.Color`.

## `dvui` is injected, not a dependency

This package does **not** depend on `dvui` in `build.zig.zon`. `dvui` moves fast and pins to a specific backend/version, so the downstream app must supply its own `dvui` module. Without this, `icons` and `tailwind` work out of the box, but `theme` (and anything that needs `dvui.Color`) will fail to compile until you inject it.

In your `build.zig`:

```zig
const dvui_dep = b.dependency("dvui", .{ .target = target, .optimize = optimize, .backend = .sdl3 });
const dvui_mod = dvui_dep.module("dvui_sdl3"); // module name depends on the chosen backend

const kit_dep = b.dependency("dvui_kit", .{ .target = target, .optimize = optimize });
const kit_mod = kit_dep.module("dvui_kit");
kit_mod.addImport("dvui", dvui_mod);

exe.root_module.addImport("dvui_kit", kit_mod);
```

## Usage

```zig
const kit = @import("dvui_kit");

// icons (TVG bytes, feed straight into dvui.icon()/dvui.buttonIcon())
const icon_bytes = kit.icons.tvg.feather.activity;

// raw hex, no dvui needed
const hex: []const u8 = kit.tailwind.blue500; // "#3b82f6"

// dvui.Color, needs dvui injected (see above)
const color: dvui.Color = kit.theme.blue500;
```

## `test/` — showcase app

`test/` is a standalone Zig project (own `build.zig`/`build.zig.zon`) that pulls in mainline `dvui` (SDL3 backend) plus this kit, and renders the icon set and tailwind/theme swatches in one window. Use it to see what the kit provides and as a worked example of wiring `dvui` + `dvui_kit` together.

```sh
cd test
zig build run
```

## Licensing

- this library: MIT
- tailwind colors: MIT (Tailwind Labs, Inc.)
- icons: see [zig-lib-icons](https://github.com/nat3Github/zig-lib-icons) (feather MIT, lucide ISC, heroicons MIT)
