//! Showcase app for lib-dvui-kit: browse every icon in every embedded icon
//! set and every tailwind color shade, with live filtering, sizing and
//! tinting -- all pulled from this kit's comptime reflection over its own
//! generated modules (no hand-maintained icon/color lists).
const std = @import("std");
const dvui = @import("dvui");
const SDLBackend = @import("sdl3");
const kit = @import("dvui_kit");

const window_icon_png = @embedFile("zig-favicon.png");

// --- shared demo state (plain globals, single-window demo like dvui's own Examples) ---
var main_tab: usize = 0;
var icon_set_idx: usize = 0;
var icon_size: f32 = 28;
var icon_tint: dvui.Color = .black;
var icon_search: [64:0]u8 = @splat(0);
var color_search: [64:0]u8 = @splat(0);
var selected_icon: ?struct { label: []const u8, name: []const u8, bytes: []const u8 } = null;

const icon_set_labels = [_][]const u8{ "feather", "lucide", "entypo", "heroicons-outline", "heroicons-solid" };

const ColorEntry = struct { name: []const u8, color: dvui.Color };
const ColorRow = struct { name: []const u8, entries: []const ColorEntry };

const shade_names = [_][]const u8{ "50", "100", "200", "300", "400", "500", "600", "700", "800", "900", "950" };

fn familyEntries(comptime T: type, comptime family_name: []const u8) []const ColorEntry {
    comptime var arr: [shade_names.len]ColorEntry = undefined;
    comptime var n = 0;
    inline for (shade_names) |shade| {
        if (@hasDecl(T, shade)) {
            arr[n] = .{ .name = family_name ++ "." ++ shade, .color = @field(T, shade) };
            n += 1;
        }
    }
    const frozen = arr;
    return frozen[0..n];
}

// tailscan.com/colors layout: neutrals first, then hues in rainbow order.
const family_order = [_][]const u8{
    "slate", "gray",   "zinc",    "neutral", "stone",
    "red",   "orange", "amber",   "yellow",  "lime",
    "green", "emerald", "teal",   "cyan",    "sky",
    "blue",  "indigo", "violet",  "purple",  "fuchsia",
    "pink",  "rose",
};

const color_rows = blk: {
    var rows: [family_order.len]ColorRow = undefined;
    for (family_order, 0..) |name, i| {
        rows[i] = .{ .name = name, .entries = familyEntries(@field(kit.tailwind, name), name) };
    }
    break :blk rows;
};

const bw_row = [_]ColorEntry{
    .{ .name = "black", .color = kit.tailwind.black },
    .{ .name = "white", .color = kit.tailwind.white },
};

pub fn main(main_init: std.process.Init) !void {
    if (@import("builtin").os.tag == .windows) {
        dvui.Backend.Common.windowsAttachConsole() catch {};
    }

    SDLBackend.enableSDLLogging();

    var backend = try SDLBackend.initWindow(.{
        .io = main_init.io,
        .environ_map = main_init.environ_map,
        .size = .{ .w = 900.0, .h = 650.0 },
        .min_size = .{ .w = 400.0, .h = 300.0 },
        .vsync = true,
        .title = "lib-dvui-kit showcase",
        .icon = window_icon_png,
    });
    defer backend.deinit();

    var window_open = true;
    var win = try dvui.Window.init(@src(), main_init.gpa, backend.backend(), .{
        .theme = switch (backend.preferredColorScheme() orelse .light) {
            .light => dvui.Theme.builtin.adwaita_light,
            .dark => dvui.Theme.builtin.adwaita_dark,
        },
        .open_flag = &window_open,
    });
    defer win.deinit();

    var interrupted = false;
    main_loop: while (window_open) {
        const nstime = win.beginWait(interrupted);
        try win.begin(nstime);
        try backend.addAllEvents(&win);

        const keep_running = gui_frame();
        if (!keep_running) break :main_loop;

        const end_micros = try win.end(.{});
        const wait_event_micros = win.waitTime(end_micros);
        interrupted = try backend.waitEventTimeout(wait_event_micros);
    }
}

fn gui_frame() bool {
    {
        var hbox = dvui.box(@src(), .{ .dir = .horizontal }, .{
            .style = .window,
            .background = true,
            .expand = .horizontal,
            .name = "main",
        });
        defer hbox.deinit();

        dvui.labelNoFmt(@src(), "lib-dvui-kit showcase", .{}, .{
            .font = .theme(.title),
            .margin = .{ .x = 8, .w = 8 },
        });
    }

    var page = dvui.box(@src(), .{}, .{ .expand = .both, .margin = .all(8) });
    defer page.deinit();

    var tabs = dvui.tabs(@src(), .{ .dir = .horizontal }, .{ .expand = .horizontal });
    if (tabs.addTabLabel(main_tab == 0, "icons", .{})) main_tab = 0;
    if (tabs.addTabLabel(main_tab == 1, "colors", .{})) main_tab = 1;
    tabs.deinit();

    switch (main_tab) {
        0 => iconsTab(),
        1 => colorsTab(),
        else => {},
    }

    for (dvui.events()) |*e| {
        if (e.evt == .window and e.evt.window.action == .close) return false;
    }
    return true;
}

fn iconsTab() void {
    var vbox = dvui.box(@src(), .{}, .{ .expand = .both });
    defer vbox.deinit();

    {
        var controls = dvui.box(@src(), .{ .dir = .horizontal }, .{ .expand = .horizontal, .margin = .{ .h = 6 } });
        defer controls.deinit();

        _ = dvui.sliderEntry(@src(), "size: {d:0.0}", .{ .value = &icon_size, .min = 12, .max = 96, .interval = 1 }, .{ .min_size_content = .{ .w = 120 }, .gravity_y = 0.5 });

        var swatch = dvui.box(@src(), .{}, .{
            .min_size_content = .{ .w = 28, .h = 28 },
            .background = true,
            .color_fill = icon_tint,
            .border = dvui.Rect.all(1),
            .margin = .{ .x = 8 },
            .gravity_y = 0.5,
        });
        swatch.deinit();
        dvui.labelNoFmt(@src(), "tint (pick one in the colors tab)", .{}, .{ .gravity_y = 0.5, .margin = .{ .x = 4 } });

        if (dvui.button(@src(), "reset tint", .{}, .{ .gravity_y = 0.5, .margin = .{ .x = 8 } })) icon_tint = .black;
    }

    if (selected_icon) |sel| {
        var preview = dvui.box(@src(), .{ .dir = .horizontal }, .{ .expand = .horizontal, .margin = .{ .h = 8 }, .background = true, .corners = .all(6), .padding = dvui.Rect.all(8) });
        defer preview.deinit();

        dvui.icon(@src(), "preview", sel.bytes, .{ .fill_color = icon_tint, .stroke_color = icon_tint }, .{ .min_size_content = .{ .w = 64, .h = 64 }, .gravity_y = 0.5 });

        var buf: [160]u8 = undefined;
        const text = std.fmt.bufPrint(&buf, "kit.icons.tvg.{s}.{s}  (click any icon below to preview + copy)", .{ sel.label, sel.name }) catch sel.name;
        dvui.labelNoFmt(@src(), text, .{}, .{ .gravity_y = 0.5, .margin = .{ .x = 12 } });
    }

    {
        var set_tabs = dvui.tabs(@src(), .{ .dir = .horizontal }, .{ .expand = .horizontal });
        for (icon_set_labels, 0..) |label, i| {
            if (set_tabs.addTabLabel(icon_set_idx == i, label, .{ .id_extra = i })) icon_set_idx = i;
        }
        set_tabs.deinit();
    }

    const search = dvui.textEntry(@src(), .{ .text = .{ .buffer = &icon_search }, .placeholder = "Filter icons..." }, .{ .expand = .horizontal });
    const filter = search.getText();
    search.deinit();

    switch (icon_set_idx) {
        0 => iconsPane(kit.icons.tvg.feather, "feather", 0, filter),
        1 => iconsPane(kit.icons.tvg.lucide, "lucide", 1, filter),
        2 => iconsPane(kit.icons.tvg.entypo, "entypo", 2, filter),
        3 => iconsPane(kit.icons.tvg.heroicons.outline, "heroicons.outline", 3, filter),
        4 => iconsPane(kit.icons.tvg.heroicons.solid, "heroicons.solid", 4, filter),
        else => {},
    }
}

fn iconsPane(comptime Module: type, comptime module_label: []const u8, set_idx: usize, filter: []const u8) void {
    const num_icons = @typeInfo(Module).@"struct".decls.len;
    const Entry = struct { name: []const u8, bytes: []const u8 };
    const entries: [num_icons]Entry = comptime blk: {
        @setEvalBranchQuota(num_icons * 10 + 1000);
        var arr: [num_icons]Entry = undefined;
        for (@typeInfo(Module).@"struct".decls, 0..) |d, i| {
            arr[i] = .{ .name = d.name, .bytes = @field(Module, d.name) };
        }
        break :blk arr;
    };

    const uniq_id = dvui.parentGet().extendId(@src(), set_idx);

    const RowState = struct { row_height: f32 = 0, num_rows: u32 = @as(u32, num_icons) };
    const state: *RowState = dvui.dataGetPtrDefault(null, uniq_id, "row_state", RowState, .{});

    const height = @as(f32, @floatFromInt(state.num_rows)) * state.row_height;
    var scroll_info: dvui.ScrollInfo = .{ .vertical = .given };
    if (dvui.dataGet(null, uniq_id, "scroll_info", dvui.ScrollInfo)) |si| {
        scroll_info = si;
        scroll_info.virtual_size.h = height;
    }
    defer dvui.dataSet(null, uniq_id, "scroll_info", scroll_info);

    var scroll = dvui.scrollArea(@src(), .{ .scroll_info = &scroll_info }, .{ .expand = .both });
    defer scroll.deinit();

    const visible_rect = scroll.si.viewport;
    var cursor: f32 = 0;
    state.num_rows = 0;

    for (entries, 0..) |entry, i| {
        if (filter.len > 0 and std.ascii.findIgnoreCase(entry.name, filter) == null) continue;
        state.num_rows += 1;

        if (cursor <= (visible_rect.y + visible_rect.h + 100) and (cursor + state.row_height + 100) >= visible_rect.y) {
            const r = dvui.Rect{ .x = 0, .y = cursor, .w = 0, .h = state.row_height };
            var row = dvui.box(@src(), .{ .dir = .horizontal }, .{ .id_extra = i, .expand = .horizontal, .rect = r });

            var buf: [160]u8 = undefined;
            const full_name = std.fmt.bufPrint(&buf, "kit.icons.tvg.{s}.{s}", .{ module_label, entry.name }) catch entry.name;
            if (dvui.buttonIcon(@src(), full_name, entry.bytes, .{}, .{ .fill_color = icon_tint, .stroke_color = icon_tint }, .{
                .min_size_content = .{ .h = icon_size },
                .id_extra = i,
            })) {
                selected_icon = .{ .label = module_label, .name = entry.name, .bytes = entry.bytes };
                dvui.clipboardTextSet(full_name);
                var buf2: [180]u8 = undefined;
                const toast_text = std.fmt.bufPrint(&buf2, "copied {s}", .{full_name}) catch "copied";
                dvui.toast(@src(), .{ .message = toast_text, .timeout = 1_000_000 });
            }
            dvui.labelNoFmt(@src(), entry.name, .{}, .{ .gravity_y = 0.5, .id_extra = i, .margin = .{ .x = 6 } });

            const row_id = row.data().id;
            row.deinit();
            state.row_height = dvui.minSizeGet(row_id).?.h;
        }
        cursor += state.row_height;
    }
}

fn colorsTab() void {
    var vbox = dvui.box(@src(), .{}, .{ .expand = .both });
    defer vbox.deinit();

    const search = dvui.textEntry(@src(), .{ .text = .{ .buffer = &color_search }, .placeholder = "Filter colors (e.g. blue, 500)..." }, .{ .expand = .horizontal });
    const filter = search.getText();
    search.deinit();

    var scroll = dvui.scrollArea(@src(), .{}, .{ .expand = .both, .margin = .{ .y = 6 } });
    defer scroll.deinit();

    var rows_box = dvui.box(@src(), .{ .dir = .vertical }, .{ .expand = .horizontal });
    defer rows_box.deinit();

    colorRow(&bw_row, "black/white", 0, filter);
    for (color_rows, 0..) |row, i| {
        colorRow(row.entries, row.name, i + 1, filter);
    }
}

fn colorRow(entries: []const ColorEntry, row_name: []const u8, row_id: usize, filter: []const u8) void {
    if (filter.len > 0) {
        var any_match = false;
        for (entries) |entry| {
            if (std.ascii.findIgnoreCase(entry.name, filter) != null) any_match = true;
        }
        if (!any_match) return;
    }

    var row = dvui.box(@src(), .{ .dir = .horizontal }, .{ .id_extra = row_id, .expand = .horizontal, .margin = .{ .y = 4 } });
    defer row.deinit();

    dvui.labelNoFmt(@src(), row_name, .{}, .{
        .id_extra = row_id,
        .min_size_content = .{ .w = 72 },
        .gravity_y = 0.5,
        .font = .theme(.body),
    });

    for (entries, 0..) |entry, i| {
        if (filter.len > 0 and std.ascii.findIgnoreCase(entry.name, filter) == null) continue;

        const selected = std.meta.eql(entry.color, icon_tint);
        const uid = row_id * 100 + i;

        if (dvui.button(@src(), "", .{}, .{
            .id_extra = uid,
            .min_size_content = .{ .w = 48, .h = 40 },
            .color_fill = entry.color,
            .border = if (selected) dvui.Rect.all(3) else dvui.Rect.all(1),
            .margin = .{ .w = 2 },
        })) {
            icon_tint = entry.color;
            dvui.clipboardTextSet(entry.name);
            var buf: [96]u8 = undefined;
            const toast_text = std.fmt.bufPrint(&buf, "tint set to kit.tailwind.{s}", .{entry.name}) catch "tint set";
            dvui.toast(@src(), .{ .message = toast_text, .timeout = 900_000 });
        }
    }
}
