const dvui = @import("dvui");

pub const tailwind = struct {
    pub const black = dvui.Color{ .r = 0x00, .g = 0x00, .b = 0x00 };
    pub const white = dvui.Color{ .r = 0xFF, .g = 0xFF, .b = 0xFF };

    pub const amber = struct {
        pub const @"50" = dvui.Color{ .r = 0xFF, .g = 0xFB, .b = 0xEB };
        pub const @"100" = dvui.Color{ .r = 0xFE, .g = 0xF3, .b = 0xC7 };
        pub const @"200" = dvui.Color{ .r = 0xFD, .g = 0xE6, .b = 0x8A };
        pub const @"300" = dvui.Color{ .r = 0xFC, .g = 0xD3, .b = 0x4D };
        pub const @"400" = dvui.Color{ .r = 0xFB, .g = 0xBF, .b = 0x24 };
        pub const @"500" = dvui.Color{ .r = 0xF5, .g = 0x9E, .b = 0x0B };
        pub const @"600" = dvui.Color{ .r = 0xD9, .g = 0x77, .b = 0x06 };
        pub const @"700" = dvui.Color{ .r = 0xB4, .g = 0x53, .b = 0x09 };
        pub const @"800" = dvui.Color{ .r = 0x92, .g = 0x40, .b = 0x0E };
        pub const @"900" = dvui.Color{ .r = 0x78, .g = 0x35, .b = 0x0F };
        pub const @"950" = dvui.Color{ .r = 0x45, .g = 0x1A, .b = 0x03 };
    };
    pub const blue = struct {
        pub const @"50" = dvui.Color{ .r = 0xEF, .g = 0xF6, .b = 0xFF };
        pub const @"100" = dvui.Color{ .r = 0xDB, .g = 0xEA, .b = 0xFE };
        pub const @"200" = dvui.Color{ .r = 0xBF, .g = 0xDB, .b = 0xFE };
        pub const @"300" = dvui.Color{ .r = 0x93, .g = 0xC5, .b = 0xFD };
        pub const @"400" = dvui.Color{ .r = 0x60, .g = 0xA5, .b = 0xFA };
        pub const @"500" = dvui.Color{ .r = 0x3B, .g = 0x82, .b = 0xF6 };
        pub const @"600" = dvui.Color{ .r = 0x25, .g = 0x63, .b = 0xEB };
        pub const @"700" = dvui.Color{ .r = 0x1D, .g = 0x4E, .b = 0xD8 };
        pub const @"800" = dvui.Color{ .r = 0x1E, .g = 0x40, .b = 0xAF };
        pub const @"900" = dvui.Color{ .r = 0x1E, .g = 0x3A, .b = 0x8A };
        pub const @"950" = dvui.Color{ .r = 0x17, .g = 0x25, .b = 0x54 };
    };
    pub const cyan = struct {
        pub const @"50" = dvui.Color{ .r = 0xEC, .g = 0xFE, .b = 0xFF };
        pub const @"100" = dvui.Color{ .r = 0xCF, .g = 0xFA, .b = 0xFE };
        pub const @"200" = dvui.Color{ .r = 0xA5, .g = 0xF3, .b = 0xFC };
        pub const @"300" = dvui.Color{ .r = 0x67, .g = 0xE8, .b = 0xF9 };
        pub const @"400" = dvui.Color{ .r = 0x22, .g = 0xD3, .b = 0xEE };
        pub const @"500" = dvui.Color{ .r = 0x06, .g = 0xB6, .b = 0xD4 };
        pub const @"600" = dvui.Color{ .r = 0x08, .g = 0x91, .b = 0xB2 };
        pub const @"700" = dvui.Color{ .r = 0x0E, .g = 0x74, .b = 0x90 };
        pub const @"800" = dvui.Color{ .r = 0x15, .g = 0x5E, .b = 0x75 };
        pub const @"900" = dvui.Color{ .r = 0x16, .g = 0x4E, .b = 0x63 };
        pub const @"950" = dvui.Color{ .r = 0x08, .g = 0x33, .b = 0x44 };
    };
    pub const emerald = struct {
        pub const @"100" = dvui.Color{ .r = 0xD1, .g = 0xFA, .b = 0xE5 };
        pub const @"200" = dvui.Color{ .r = 0xA7, .g = 0xF3, .b = 0xD0 };
        pub const @"300" = dvui.Color{ .r = 0x6E, .g = 0xE7, .b = 0xB7 };
        pub const @"400" = dvui.Color{ .r = 0x34, .g = 0xD3, .b = 0x99 };
        pub const @"500" = dvui.Color{ .r = 0x10, .g = 0xB9, .b = 0x81 };
        pub const @"600" = dvui.Color{ .r = 0x05, .g = 0x96, .b = 0x69 };
        pub const @"700" = dvui.Color{ .r = 0x04, .g = 0x78, .b = 0x57 };
        pub const @"800" = dvui.Color{ .r = 0x06, .g = 0x5F, .b = 0x46 };
        pub const @"900" = dvui.Color{ .r = 0x06, .g = 0x4E, .b = 0x3B };
        pub const @"950" = dvui.Color{ .r = 0x02, .g = 0x2C, .b = 0x22 };
    };
    pub const fuchsia = struct {
        pub const @"50" = dvui.Color{ .r = 0xFD, .g = 0xF4, .b = 0xFF };
        pub const @"100" = dvui.Color{ .r = 0xFA, .g = 0xE8, .b = 0xFF };
        pub const @"200" = dvui.Color{ .r = 0xF5, .g = 0xD0, .b = 0xFE };
        pub const @"300" = dvui.Color{ .r = 0xF0, .g = 0xAB, .b = 0xFC };
        pub const @"400" = dvui.Color{ .r = 0xE8, .g = 0x79, .b = 0xF9 };
        pub const @"500" = dvui.Color{ .r = 0xD9, .g = 0x46, .b = 0xEF };
        pub const @"600" = dvui.Color{ .r = 0xC0, .g = 0x26, .b = 0xD3 };
        pub const @"700" = dvui.Color{ .r = 0xA2, .g = 0x1C, .b = 0xAF };
        pub const @"800" = dvui.Color{ .r = 0x86, .g = 0x19, .b = 0x8F };
        pub const @"900" = dvui.Color{ .r = 0x70, .g = 0x1A, .b = 0x75 };
        pub const @"950" = dvui.Color{ .r = 0x4A, .g = 0x04, .b = 0x4E };
    };
    pub const gray = struct {
        pub const @"50" = dvui.Color{ .r = 0xF9, .g = 0xFA, .b = 0xFB };
        pub const @"100" = dvui.Color{ .r = 0xF3, .g = 0xF4, .b = 0xF6 };
        pub const @"200" = dvui.Color{ .r = 0xE5, .g = 0xE7, .b = 0xEB };
        pub const @"300" = dvui.Color{ .r = 0xD1, .g = 0xD5, .b = 0xDB };
        pub const @"400" = dvui.Color{ .r = 0x9C, .g = 0xA3, .b = 0xAF };
        pub const @"500" = dvui.Color{ .r = 0x6B, .g = 0x72, .b = 0x80 };
        pub const @"600" = dvui.Color{ .r = 0x4B, .g = 0x55, .b = 0x63 };
        pub const @"700" = dvui.Color{ .r = 0x37, .g = 0x41, .b = 0x51 };
        pub const @"800" = dvui.Color{ .r = 0x1F, .g = 0x29, .b = 0x37 };
        pub const @"900" = dvui.Color{ .r = 0x11, .g = 0x18, .b = 0x27 };
        pub const @"950" = dvui.Color{ .r = 0x03, .g = 0x07, .b = 0x12 };
    };
    pub const green = struct {
        pub const @"50" = dvui.Color{ .r = 0xF0, .g = 0xFD, .b = 0xF4 };
        pub const @"100" = dvui.Color{ .r = 0xDC, .g = 0xFC, .b = 0xE7 };
        pub const @"200" = dvui.Color{ .r = 0xBB, .g = 0xF7, .b = 0xD0 };
        pub const @"300" = dvui.Color{ .r = 0x86, .g = 0xEF, .b = 0xAC };
        pub const @"400" = dvui.Color{ .r = 0x4A, .g = 0xDE, .b = 0x80 };
        pub const @"500" = dvui.Color{ .r = 0x22, .g = 0xC5, .b = 0x5E };
        pub const @"600" = dvui.Color{ .r = 0x16, .g = 0xA3, .b = 0x4A };
        pub const @"700" = dvui.Color{ .r = 0x15, .g = 0x80, .b = 0x3D };
        pub const @"800" = dvui.Color{ .r = 0x16, .g = 0x65, .b = 0x34 };
        pub const @"900" = dvui.Color{ .r = 0x14, .g = 0x53, .b = 0x2D };
        pub const @"950" = dvui.Color{ .r = 0x05, .g = 0x2E, .b = 0x16 };
    };
    pub const indigo = struct {
        pub const @"50" = dvui.Color{ .r = 0xEE, .g = 0xF2, .b = 0xFF };
        pub const @"100" = dvui.Color{ .r = 0xE0, .g = 0xE7, .b = 0xFF };
        pub const @"200" = dvui.Color{ .r = 0xC7, .g = 0xD2, .b = 0xFE };
        pub const @"300" = dvui.Color{ .r = 0xA5, .g = 0xB4, .b = 0xFC };
        pub const @"400" = dvui.Color{ .r = 0x81, .g = 0x8C, .b = 0xF8 };
        pub const @"500" = dvui.Color{ .r = 0x63, .g = 0x66, .b = 0xF1 };
        pub const @"600" = dvui.Color{ .r = 0x4F, .g = 0x46, .b = 0xE5 };
        pub const @"700" = dvui.Color{ .r = 0x43, .g = 0x38, .b = 0xCA };
        pub const @"800" = dvui.Color{ .r = 0x37, .g = 0x30, .b = 0xA3 };
        pub const @"900" = dvui.Color{ .r = 0x31, .g = 0x2E, .b = 0x81 };
        pub const @"950" = dvui.Color{ .r = 0x1E, .g = 0x1B, .b = 0x4B };
    };
    pub const lime = struct {
        pub const @"50" = dvui.Color{ .r = 0xF7, .g = 0xFE, .b = 0xE7 };
        pub const @"100" = dvui.Color{ .r = 0xEC, .g = 0xFC, .b = 0xCB };
        pub const @"200" = dvui.Color{ .r = 0xD9, .g = 0xF9, .b = 0x9D };
        pub const @"300" = dvui.Color{ .r = 0xBE, .g = 0xF2, .b = 0x64 };
        pub const @"400" = dvui.Color{ .r = 0xA3, .g = 0xE6, .b = 0x35 };
        pub const @"500" = dvui.Color{ .r = 0x84, .g = 0xCC, .b = 0x16 };
        pub const @"600" = dvui.Color{ .r = 0x65, .g = 0xA3, .b = 0x0D };
        pub const @"700" = dvui.Color{ .r = 0x4D, .g = 0x7C, .b = 0x0F };
        pub const @"800" = dvui.Color{ .r = 0x3F, .g = 0x62, .b = 0x12 };
        pub const @"900" = dvui.Color{ .r = 0x36, .g = 0x53, .b = 0x14 };
        pub const @"950" = dvui.Color{ .r = 0x1A, .g = 0x2E, .b = 0x05 };
    };
    pub const neutral = struct {
        pub const @"50" = dvui.Color{ .r = 0xFA, .g = 0xFA, .b = 0xFA };
        pub const @"100" = dvui.Color{ .r = 0xF5, .g = 0xF5, .b = 0xF5 };
        pub const @"200" = dvui.Color{ .r = 0xE5, .g = 0xE5, .b = 0xE5 };
        pub const @"300" = dvui.Color{ .r = 0xD4, .g = 0xD4, .b = 0xD4 };
        pub const @"400" = dvui.Color{ .r = 0xA3, .g = 0xA3, .b = 0xA3 };
        pub const @"500" = dvui.Color{ .r = 0x73, .g = 0x73, .b = 0x73 };
        pub const @"600" = dvui.Color{ .r = 0x52, .g = 0x52, .b = 0x52 };
        pub const @"700" = dvui.Color{ .r = 0x40, .g = 0x40, .b = 0x40 };
        pub const @"800" = dvui.Color{ .r = 0x26, .g = 0x26, .b = 0x26 };
        pub const @"900" = dvui.Color{ .r = 0x17, .g = 0x17, .b = 0x17 };
        pub const @"950" = dvui.Color{ .r = 0x0A, .g = 0x0A, .b = 0x0A };
    };
    pub const orange = struct {
        pub const @"50" = dvui.Color{ .r = 0xFF, .g = 0xF7, .b = 0xED };
        pub const @"100" = dvui.Color{ .r = 0xFF, .g = 0xED, .b = 0xD5 };
        pub const @"200" = dvui.Color{ .r = 0xFE, .g = 0xD7, .b = 0xAA };
        pub const @"300" = dvui.Color{ .r = 0xFD, .g = 0xBA, .b = 0x74 };
        pub const @"400" = dvui.Color{ .r = 0xFB, .g = 0x92, .b = 0x3C };
        pub const @"500" = dvui.Color{ .r = 0xF9, .g = 0x73, .b = 0x16 };
        pub const @"600" = dvui.Color{ .r = 0xEA, .g = 0x58, .b = 0x0C };
        pub const @"700" = dvui.Color{ .r = 0xC2, .g = 0x41, .b = 0x0C };
        pub const @"800" = dvui.Color{ .r = 0x9A, .g = 0x34, .b = 0x12 };
        pub const @"900" = dvui.Color{ .r = 0x7C, .g = 0x2D, .b = 0x12 };
        pub const @"950" = dvui.Color{ .r = 0x43, .g = 0x14, .b = 0x07 };
    };
    pub const pink = struct {
        pub const @"50" = dvui.Color{ .r = 0xFD, .g = 0xF2, .b = 0xF8 };
        pub const @"100" = dvui.Color{ .r = 0xFC, .g = 0xE7, .b = 0xF3 };
        pub const @"200" = dvui.Color{ .r = 0xFB, .g = 0xCF, .b = 0xE8 };
        pub const @"300" = dvui.Color{ .r = 0xF9, .g = 0xA8, .b = 0xD4 };
        pub const @"400" = dvui.Color{ .r = 0xF4, .g = 0x72, .b = 0xB6 };
        pub const @"500" = dvui.Color{ .r = 0xEC, .g = 0x48, .b = 0x99 };
        pub const @"600" = dvui.Color{ .r = 0xDB, .g = 0x27, .b = 0x77 };
        pub const @"700" = dvui.Color{ .r = 0xBE, .g = 0x18, .b = 0x5D };
        pub const @"800" = dvui.Color{ .r = 0x9D, .g = 0x17, .b = 0x4D };
        pub const @"900" = dvui.Color{ .r = 0x83, .g = 0x18, .b = 0x43 };
        pub const @"950" = dvui.Color{ .r = 0x50, .g = 0x07, .b = 0x24 };
    };
    pub const purple = struct {
        pub const @"50" = dvui.Color{ .r = 0xFA, .g = 0xF5, .b = 0xFF };
        pub const @"100" = dvui.Color{ .r = 0xF3, .g = 0xE8, .b = 0xFF };
        pub const @"200" = dvui.Color{ .r = 0xE9, .g = 0xD5, .b = 0xFF };
        pub const @"300" = dvui.Color{ .r = 0xD8, .g = 0xB4, .b = 0xFE };
        pub const @"400" = dvui.Color{ .r = 0xC0, .g = 0x84, .b = 0xFC };
        pub const @"500" = dvui.Color{ .r = 0xA8, .g = 0x55, .b = 0xF7 };
        pub const @"600" = dvui.Color{ .r = 0x93, .g = 0x33, .b = 0xEA };
        pub const @"700" = dvui.Color{ .r = 0x7E, .g = 0x22, .b = 0xCE };
        pub const @"800" = dvui.Color{ .r = 0x6B, .g = 0x21, .b = 0xA8 };
        pub const @"900" = dvui.Color{ .r = 0x58, .g = 0x1C, .b = 0x87 };
        pub const @"950" = dvui.Color{ .r = 0x3B, .g = 0x07, .b = 0x64 };
    };
    pub const red = struct {
        pub const @"50" = dvui.Color{ .r = 0xFE, .g = 0xF2, .b = 0xF2 };
        pub const @"100" = dvui.Color{ .r = 0xFE, .g = 0xE2, .b = 0xE2 };
        pub const @"200" = dvui.Color{ .r = 0xFE, .g = 0xCA, .b = 0xCA };
        pub const @"300" = dvui.Color{ .r = 0xFC, .g = 0xA5, .b = 0xA5 };
        pub const @"400" = dvui.Color{ .r = 0xF8, .g = 0x71, .b = 0x71 };
        pub const @"500" = dvui.Color{ .r = 0xEF, .g = 0x44, .b = 0x44 };
        pub const @"600" = dvui.Color{ .r = 0xDC, .g = 0x26, .b = 0x26 };
        pub const @"700" = dvui.Color{ .r = 0xB9, .g = 0x1C, .b = 0x1C };
        pub const @"800" = dvui.Color{ .r = 0x99, .g = 0x1B, .b = 0x1B };
        pub const @"900" = dvui.Color{ .r = 0x7F, .g = 0x1D, .b = 0x1D };
        pub const @"950" = dvui.Color{ .r = 0x45, .g = 0x0A, .b = 0x0A };
    };
    pub const rose = struct {
        pub const @"50" = dvui.Color{ .r = 0xFF, .g = 0xF1, .b = 0xF2 };
        pub const @"100" = dvui.Color{ .r = 0xFF, .g = 0xE4, .b = 0xE6 };
        pub const @"200" = dvui.Color{ .r = 0xFE, .g = 0xCD, .b = 0xD3 };
        pub const @"300" = dvui.Color{ .r = 0xFD, .g = 0xA4, .b = 0xAF };
        pub const @"400" = dvui.Color{ .r = 0xFB, .g = 0x71, .b = 0x85 };
        pub const @"500" = dvui.Color{ .r = 0xF4, .g = 0x3F, .b = 0x5E };
        pub const @"600" = dvui.Color{ .r = 0xE1, .g = 0x1D, .b = 0x48 };
        pub const @"700" = dvui.Color{ .r = 0xBE, .g = 0x12, .b = 0x3C };
        pub const @"800" = dvui.Color{ .r = 0x9F, .g = 0x12, .b = 0x39 };
        pub const @"900" = dvui.Color{ .r = 0x88, .g = 0x13, .b = 0x37 };
        pub const @"950" = dvui.Color{ .r = 0x4C, .g = 0x05, .b = 0x19 };
    };
    pub const sky = struct {
        pub const @"50" = dvui.Color{ .r = 0xF0, .g = 0xF9, .b = 0xFF };
        pub const @"100" = dvui.Color{ .r = 0xE0, .g = 0xF2, .b = 0xFE };
        pub const @"200" = dvui.Color{ .r = 0xBA, .g = 0xE6, .b = 0xFD };
        pub const @"300" = dvui.Color{ .r = 0x7D, .g = 0xD3, .b = 0xFC };
        pub const @"400" = dvui.Color{ .r = 0x38, .g = 0xBD, .b = 0xF8 };
        pub const @"500" = dvui.Color{ .r = 0x0E, .g = 0xA5, .b = 0xE9 };
        pub const @"600" = dvui.Color{ .r = 0x02, .g = 0x84, .b = 0xC7 };
        pub const @"700" = dvui.Color{ .r = 0x03, .g = 0x69, .b = 0xA1 };
        pub const @"800" = dvui.Color{ .r = 0x07, .g = 0x59, .b = 0x85 };
        pub const @"900" = dvui.Color{ .r = 0x0C, .g = 0x4A, .b = 0x6E };
        pub const @"950" = dvui.Color{ .r = 0x08, .g = 0x2F, .b = 0x49 };
    };
    pub const slate = struct {
        pub const @"50" = dvui.Color{ .r = 0xF8, .g = 0xFA, .b = 0xFC };
        pub const @"100" = dvui.Color{ .r = 0xF1, .g = 0xF5, .b = 0xF9 };
        pub const @"200" = dvui.Color{ .r = 0xE2, .g = 0xE8, .b = 0xF0 };
        pub const @"300" = dvui.Color{ .r = 0xCB, .g = 0xD5, .b = 0xE1 };
        pub const @"400" = dvui.Color{ .r = 0x94, .g = 0xA3, .b = 0xB8 };
        pub const @"500" = dvui.Color{ .r = 0x64, .g = 0x74, .b = 0x8B };
        pub const @"600" = dvui.Color{ .r = 0x47, .g = 0x55, .b = 0x69 };
        pub const @"700" = dvui.Color{ .r = 0x33, .g = 0x41, .b = 0x55 };
        pub const @"800" = dvui.Color{ .r = 0x1E, .g = 0x29, .b = 0x3B };
        pub const @"900" = dvui.Color{ .r = 0x0F, .g = 0x17, .b = 0x2A };
        pub const @"950" = dvui.Color{ .r = 0x02, .g = 0x06, .b = 0x17 };
    };
    pub const stone = struct {
        pub const @"50" = dvui.Color{ .r = 0xFA, .g = 0xFA, .b = 0xF9 };
        pub const @"100" = dvui.Color{ .r = 0xF5, .g = 0xF5, .b = 0xF4 };
        pub const @"200" = dvui.Color{ .r = 0xE7, .g = 0xE5, .b = 0xE4 };
        pub const @"300" = dvui.Color{ .r = 0xD6, .g = 0xD3, .b = 0xD1 };
        pub const @"400" = dvui.Color{ .r = 0xA8, .g = 0xA2, .b = 0x9E };
        pub const @"500" = dvui.Color{ .r = 0x78, .g = 0x71, .b = 0x6C };
        pub const @"600" = dvui.Color{ .r = 0x57, .g = 0x53, .b = 0x4E };
        pub const @"700" = dvui.Color{ .r = 0x44, .g = 0x40, .b = 0x3C };
        pub const @"800" = dvui.Color{ .r = 0x29, .g = 0x25, .b = 0x24 };
        pub const @"900" = dvui.Color{ .r = 0x1C, .g = 0x19, .b = 0x17 };
        pub const @"950" = dvui.Color{ .r = 0x0C, .g = 0x0A, .b = 0x09 };
    };
    pub const teal = struct {
        pub const @"50" = dvui.Color{ .r = 0xF0, .g = 0xFD, .b = 0xFA };
        pub const @"100" = dvui.Color{ .r = 0xCC, .g = 0xFB, .b = 0xF1 };
        pub const @"200" = dvui.Color{ .r = 0x99, .g = 0xF6, .b = 0xE4 };
        pub const @"300" = dvui.Color{ .r = 0x5E, .g = 0xEA, .b = 0xD4 };
        pub const @"400" = dvui.Color{ .r = 0x2D, .g = 0xD4, .b = 0xBF };
        pub const @"500" = dvui.Color{ .r = 0x14, .g = 0xB8, .b = 0xA6 };
        pub const @"600" = dvui.Color{ .r = 0x0D, .g = 0x94, .b = 0x88 };
        pub const @"700" = dvui.Color{ .r = 0x0F, .g = 0x76, .b = 0x6E };
        pub const @"800" = dvui.Color{ .r = 0x11, .g = 0x5E, .b = 0x59 };
        pub const @"900" = dvui.Color{ .r = 0x13, .g = 0x4E, .b = 0x4A };
        pub const @"950" = dvui.Color{ .r = 0x04, .g = 0x2F, .b = 0x2E };
    };
    pub const violet = struct {
        pub const @"50" = dvui.Color{ .r = 0xF5, .g = 0xF3, .b = 0xFF };
        pub const @"100" = dvui.Color{ .r = 0xED, .g = 0xE9, .b = 0xFE };
        pub const @"200" = dvui.Color{ .r = 0xDD, .g = 0xD6, .b = 0xFE };
        pub const @"300" = dvui.Color{ .r = 0xC4, .g = 0xB5, .b = 0xFD };
        pub const @"400" = dvui.Color{ .r = 0xA7, .g = 0x8B, .b = 0xFA };
        pub const @"500" = dvui.Color{ .r = 0x8B, .g = 0x5C, .b = 0xF6 };
        pub const @"600" = dvui.Color{ .r = 0x7C, .g = 0x3A, .b = 0xED };
        pub const @"700" = dvui.Color{ .r = 0x6D, .g = 0x28, .b = 0xD9 };
        pub const @"800" = dvui.Color{ .r = 0x5B, .g = 0x21, .b = 0xB6 };
        pub const @"900" = dvui.Color{ .r = 0x4C, .g = 0x1D, .b = 0x95 };
        pub const @"950" = dvui.Color{ .r = 0x2E, .g = 0x10, .b = 0x65 };
    };
    pub const yellow = struct {
        pub const @"50" = dvui.Color{ .r = 0xFE, .g = 0xFC, .b = 0xE8 };
        pub const @"100" = dvui.Color{ .r = 0xFE, .g = 0xF9, .b = 0xC3 };
        pub const @"200" = dvui.Color{ .r = 0xFE, .g = 0xF0, .b = 0x8A };
        pub const @"300" = dvui.Color{ .r = 0xFD, .g = 0xE0, .b = 0x47 };
        pub const @"400" = dvui.Color{ .r = 0xFA, .g = 0xCC, .b = 0x15 };
        pub const @"500" = dvui.Color{ .r = 0xEA, .g = 0xB3, .b = 0x08 };
        pub const @"600" = dvui.Color{ .r = 0xCA, .g = 0x8A, .b = 0x04 };
        pub const @"700" = dvui.Color{ .r = 0xA1, .g = 0x62, .b = 0x07 };
        pub const @"800" = dvui.Color{ .r = 0x85, .g = 0x4D, .b = 0x0E };
        pub const @"900" = dvui.Color{ .r = 0x71, .g = 0x3F, .b = 0x12 };
        pub const @"950" = dvui.Color{ .r = 0x42, .g = 0x20, .b = 0x06 };
    };
    pub const zinc = struct {
        pub const @"50" = dvui.Color{ .r = 0xFA, .g = 0xFA, .b = 0xFA };
        pub const @"100" = dvui.Color{ .r = 0xF4, .g = 0xF4, .b = 0xF5 };
        pub const @"200" = dvui.Color{ .r = 0xE4, .g = 0xE4, .b = 0xE7 };
        pub const @"300" = dvui.Color{ .r = 0xD4, .g = 0xD4, .b = 0xD8 };
        pub const @"400" = dvui.Color{ .r = 0xA1, .g = 0xA1, .b = 0xAA };
        pub const @"500" = dvui.Color{ .r = 0x71, .g = 0x71, .b = 0x7A };
        pub const @"600" = dvui.Color{ .r = 0x52, .g = 0x52, .b = 0x5B };
        pub const @"700" = dvui.Color{ .r = 0x3F, .g = 0x3F, .b = 0x46 };
        pub const @"800" = dvui.Color{ .r = 0x27, .g = 0x27, .b = 0x2A };
        pub const @"900" = dvui.Color{ .r = 0x18, .g = 0x18, .b = 0x1B };
        pub const @"950" = dvui.Color{ .r = 0x09, .g = 0x09, .b = 0x0B };
    };
};

// MIT License
// Copyright (c) Tailwind Labs, Inc.
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
