pub const c = @cImport({
    @cInclude("freetype/ftadvanc.h");
    @cInclude("freetype/ftbbox.h");
    @cInclude("freetype/ftbitmap.h");
    @cInclude("freetype/ftcolor.h");
    @cInclude("freetype/ftlcdfil.h");
    @cInclude("freetype/ftsizes.h");
    @cInclude("freetype/ftstroke.h");
    @cInclude("freetype/fttrigon.h");
    @cInclude("freetype/ftsynth.h");
});

pub const Affine23 = c.FT_Affine23;
pub const BBox = c.FT_BBox;
pub const BitmapSize = c.FT_Bitmap_Size;
pub const CharMap = c.FT_CharMapRec;
pub const ClipBox = c.FT_ClipBox;
pub const Color = c.FT_Color;
pub const ColorIndex = c.FT_ColorIndex;
pub const ColorLine = c.FT_ColorLine;
pub const ColorStop = c.FT_ColorStop;
pub const ColorStopIterator = c.FT_ColorStopIterator;
pub const Generic = c.FT_Generic;
pub const GlyphMetrics = c.FT_Glyph_Metrics;
pub const LayerIterator = c.FT_LayerIterator;
pub const Matrix = c.FT_Matrix;
pub const OpaquePaint = c.FT_OpaquePaint;
pub const PaintColrGlyph = c.FT_PaintColrGlyph;
pub const PaintColrLayers = c.FT_PaintColrLayers;
pub const PaintComposite = c.FT_PaintComposite;
pub const PaintGlyph = c.FT_PaintGlyph;
pub const PaintLinearGradient = c.FT_PaintLinearGradient;
pub const PaintRadialGradient = c.FT_PaintRadialGradient;
pub const PaintRotate = c.FT_PaintRotate;
pub const PaintScale = c.FT_PaintScale;
pub const PaintSkew = c.FT_PaintSkew;
pub const PaintSolid = c.FT_PaintSolid;
pub const PaintSweepGradient = c.FT_PaintSweepGradient;
pub const PaintTransform = c.FT_PaintTransform;
pub const PaintTranslate = c.FT_PaintTranslate;
pub const SizeMetrics = c.FT_Size_Metrics;
pub const SizeRequest = c.FT_Size_RequestRec;
pub const Span = c.FT_Span;
pub const Vector = c.FT_Vector;

pub const angel_pi = c.FT_ANGLE_PI;
pub const angel_2pi = c.FT_ANGLE_2PI;
pub const angel_pi2 = c.FT_ANGLE_PI2;
pub const angel_pi4 = c.FT_ANGLE_PI4;

pub const BBoxMode = enum(u2) {
    // https://freetype.org/freetype2/docs/reference/ft2-glyph_management.html#ft_glyph_bbox_mode
    // both `unscaled` and `subpixel` are set to 0
    unscaled_or_subpixels = c.FT_GLYPH_BBOX_UNSCALED,
    gridfit = c.FT_GLYPH_BBOX_GRIDFIT,
    truncate = c.FT_GLYPH_BBOX_TRUNCATE,
    pixels = c.FT_GLYPH_BBOX_PIXELS,
};

pub const Border = enum(u1) {
    left,
    right,
};

pub const CompositeMode = enum(u5) {
    clear = c.FT_COLR_COMPOSITE_CLEAR,
    src = c.FT_COLR_COMPOSITE_SRC,
    dest = c.FT_COLR_COMPOSITE_DEST,
    src_over = c.FT_COLR_COMPOSITE_SRC_OVER,
    dest_over = c.FT_COLR_COMPOSITE_DEST_OVER,
    src_in = c.FT_COLR_COMPOSITE_SRC_IN,
    dest_in = c.FT_COLR_COMPOSITE_DEST_IN,
    src_out = c.FT_COLR_COMPOSITE_SRC_OUT,
    dest_out = c.FT_COLR_COMPOSITE_DEST_OUT,
    src_atop = c.FT_COLR_COMPOSITE_SRC_ATOP,
    dest_atop = c.FT_COLR_COMPOSITE_DEST_ATOP,
    xor = c.FT_COLR_COMPOSITE_XOR,
    plus = c.FT_COLR_COMPOSITE_PLUS,
    screen = c.FT_COLR_COMPOSITE_SCREEN,
    overlay = c.FT_COLR_COMPOSITE_OVERLAY,
    darken = c.FT_COLR_COMPOSITE_DARKEN,
    lighten = c.FT_COLR_COMPOSITE_LIGHTEN,
    color_dodge = c.FT_COLR_COMPOSITE_COLOR_DODGE,
    color_burn = c.FT_COLR_COMPOSITE_COLOR_BURN,
    hard_light = c.FT_COLR_COMPOSITE_HARD_LIGHT,
    soft_light = c.FT_COLR_COMPOSITE_SOFT_LIGHT,
    difference = c.FT_COLR_COMPOSITE_DIFFERENCE,
    exclusion = c.FT_COLR_COMPOSITE_EXCLUSION,
    multiply = c.FT_COLR_COMPOSITE_MULTIPLY,
    hsl_hue = c.FT_COLR_COMPOSITE_HSL_HUE,
    hsl_saturation = c.FT_COLR_COMPOSITE_HSL_SATURATION,
    hsl_color = c.FT_COLR_COMPOSITE_HSL_COLOR,
    hsl_luminosity = c.FT_COLR_COMPOSITE_HSL_LUMINOSITY,
};

pub const Encoding = enum(u31) {
    none = c.FT_ENCODING_NONE,
    ms_symbol = c.FT_ENCODING_MS_SYMBOL,
    unicode = c.FT_ENCODING_UNICODE,
    sjis = c.FT_ENCODING_SJIS,
    prc = c.FT_ENCODING_PRC,
    big5 = c.FT_ENCODING_BIG5,
    wansung = c.FT_ENCODING_WANSUNG,
    johab = c.FT_ENCODING_JOHAB,
    adobe_standard = c.FT_ENCODING_ADOBE_STANDARD,
    adobe_expert = c.FT_ENCODING_ADOBE_EXPERT,
    adobe_custom = c.FT_ENCODING_ADOBE_CUSTOM,
    adobe_latin_1 = c.FT_ENCODING_ADOBE_LATIN_1,
    old_latin_2 = c.FT_ENCODING_OLD_LATIN_2,
    apple_roman = c.FT_ENCODING_APPLE_ROMAN,
};

pub const GlyphFormat = enum(u32) {
    none = c.FT_GLYPH_FORMAT_NONE,
    composite = c.FT_GLYPH_FORMAT_COMPOSITE,
    bitmap = c.FT_GLYPH_FORMAT_BITMAP,
    outline = c.FT_GLYPH_FORMAT_OUTLINE,
    plotter = c.FT_GLYPH_FORMAT_PLOTTER,
    svg = c.FT_GLYPH_FORMAT_SVG,
};

pub const KerningMode = enum(u2) {
    default = c.FT_KERNING_DEFAULT,
    unfitted = c.FT_KERNING_UNFITTED,
    unscaled = c.FT_KERNING_UNSCALED,
};

pub const LcdFilter = enum(u5) {
    none = c.FT_LCD_FILTER_NONE,
    default = c.FT_LCD_FILTER_DEFAULT,
    light = c.FT_LCD_FILTER_LIGHT,
    legacy = c.FT_LCD_FILTER_LEGACY,
};

pub const LineCap = enum(u2) {
    butt = c.FT_STROKER_LINECAP_BUTT,
    round = c.FT_STROKER_LINECAP_ROUND,
    square = c.FT_STROKER_LINECAP_SQUARE,
};

pub const LineJoin = enum(u2) {
    round = c.FT_STROKER_LINEJOIN_ROUND,
    bevel = c.FT_STROKER_LINEJOIN_BEVEL,
    miter_variable = c.FT_STROKER_LINEJOIN_MITER_VARIABLE,
    miter_fixed = c.FT_STROKER_LINEJOIN_MITER_FIXED,
};

pub const PaintExtend = enum(u2) {
    pad = c.FT_COLR_PAINT_EXTEND_PAD,
    repeat = c.FT_COLR_PAINT_EXTEND_REPEAT,
    reflect = c.FT_COLR_PAINT_EXTEND_REFLECT,
};

pub const PaintFormat = enum(u8) {
    color_layers = c.FT_COLR_PAINTFORMAT_COLR_LAYERS,
    solid = c.FT_COLR_PAINTFORMAT_SOLID,
    linear_gradient = c.FT_COLR_PAINTFORMAT_LINEAR_GRADIENT,
    radial_gradient = c.FT_COLR_PAINTFORMAT_RADIAL_GRADIENT,
    sweep_gradient = c.FT_COLR_PAINTFORMAT_SWEEP_GRADIENT,
    glyph = c.FT_COLR_PAINTFORMAT_GLYPH,
    color_glyph = c.FT_COLR_PAINTFORMAT_COLR_GLYPH,
    transform = c.FT_COLR_PAINTFORMAT_TRANSFORM,
    translate = c.FT_COLR_PAINTFORMAT_TRANSLATE,
    scale = c.FT_COLR_PAINTFORMAT_SCALE,
    rotate = c.FT_COLR_PAINTFORMAT_ROTATE,
    skew = c.FT_COLR_PAINTFORMAT_SKEW,
    composite = c.FT_COLR_PAINTFORMAT_COMPOSITE,
};

pub const PixelMode = enum(u3) {
    none = c.FT_PIXEL_MODE_NONE,
    mono = c.FT_PIXEL_MODE_MONO,
    gray = c.FT_PIXEL_MODE_GRAY,
    gray2 = c.FT_PIXEL_MODE_GRAY2,
    gray4 = c.FT_PIXEL_MODE_GRAY4,
    lcd = c.FT_PIXEL_MODE_LCD,
    lcd_v = c.FT_PIXEL_MODE_LCD_V,
    bgra = c.FT_PIXEL_MODE_BGRA,
};

pub const RenderMode = enum(u3) {
    normal = c.FT_RENDER_MODE_NORMAL,
    light = c.FT_RENDER_MODE_LIGHT,
    mono = c.FT_RENDER_MODE_MONO,
    lcd = c.FT_RENDER_MODE_LCD,
    lcd_v = c.FT_RENDER_MODE_LCD_V,
    sdf = c.FT_RENDER_MODE_SDF,
};

pub const RootTransform = enum(u1) {
    include_root_transform = c.FT_COLOR_INCLUDE_ROOT_TRANSFORM,
    no_root_transform = c.FT_COLOR_NO_ROOT_TRANSFORM,
};

pub const SizeRequestType = enum(u3) {
    nominal = c.FT_SIZE_REQUEST_TYPE_NOMINAL,
    real_dim = c.FT_SIZE_REQUEST_TYPE_REAL_DIM,
    bbox = c.FT_SIZE_REQUEST_TYPE_BBOX,
    cell = c.FT_SIZE_REQUEST_TYPE_CELL,
    scales = c.FT_SIZE_REQUEST_TYPE_SCALES,
    max = c.FT_SIZE_REQUEST_TYPE_MAX,
};

pub const Paint = union(PaintFormat) {
    color_layers: PaintColrLayers,
    solid: PaintSolid,
    linear_gradient: PaintLinearGradient,
    radial_gradient: PaintRadialGradient,
    sweep_gradient: PaintSweepGradient,
    glyph: PaintGlyph,
    color_glyph: PaintColrGlyph,
    transform: PaintTransform,
    translate: PaintTranslate,
    scale: PaintScale,
    rotate: PaintRotate,
    skew: PaintSkew,
    composite: PaintComposite,
};

pub const FaceFlags = packed struct(c_long) {
    scalable: bool = false,
    fixed_sizes: bool = false,
    fixed_width: bool = false,
    sfnt: bool = false,
    horizontal: bool = false,
    vertical: bool = false,
    kerning: bool = false,
    fast_glyphs: bool = false,
    multiple_masters: bool = false,
    glyph_names: bool = false,
    external_stream: bool = false,
    hinter: bool = false,
    cid_keyed: bool = false,
    tricky: bool = false,
    color: bool = false,
    variation: bool = false,
    svg: bool = false,
    sbix: bool = false,
    sbix_overlay: bool = false,
    _padding: if (@sizeOf(c_long) == 4) u13 else u45 = 0,
};

pub const FSType = packed struct(c_ushort) {
    installable_embedding: bool = false,
    restriced_license_embedding: bool = false,
    preview_and_print_embedding: bool = false,
    editable_embedding: bool = false,
    _padding: u4 = 0,
    no_subsetting: bool = false,
    bitmap_embedding_only: bool = false,
    _padding0: u6 = 0,
};

pub const LoadFlags = packed struct(c_int) {
    no_scale: bool = false,
    no_hinting: bool = false,
    render: bool = false,
    no_bitmap: bool = false,
    vertical_layout: bool = false,
    force_autohint: bool = false,
    crop_bitmap: bool = false,
    pedantic: bool = false,
    ignore_global_advance_with: bool = false,
    no_recurse: bool = false,
    ignore_transform: bool = false,
    monochrome: bool = false,
    linear_design: bool = false,
    no_autohint: bool = false,
    _padding: u1 = 0,
    target_normal: bool = false,
    target_light: bool = false,
    target_mono: bool = false,
    target_lcd: bool = false,
    target_lcd_v: bool = false,
    color: bool = false,
    compute_metrics: bool = false,
    bitmap_metrics_only: bool = false,
    _padding0: u9 = 0,
};

pub const OpenFlags = packed struct(c_int) {
    memory: bool = false,
    stream: bool = false,
    path: bool = false,
    driver: bool = false,
    params: bool = false,
    _padding: u27 = 0,
};

pub const PaletteFlags = packed struct(c_ushort) {
    for_light_background: bool = false,
    for_dark_background: bool = false,
    _padding: u14 = 0,
};

pub const StyleFlags = packed struct(c_long) {
    italic: bool = false,
    bold: bool = false,
    _padding: if (@sizeOf(c_long) == 4) u30 else u62 = 0,
};

pub const Bitmap = struct {
    handle: c.FT_Bitmap,

    pub fn init() Bitmap {
        var b: c.FT_Bitmap = undefined;
        c.FT_Bitmap_Init(&b);
        return .{ .handle = b };
    }

    pub fn deinit(self: *Bitmap, lib: Library) void {
        _ = c.FT_Bitmap_Done(lib.handle, &self.handle);
    }

    pub fn copy(self: Bitmap, lib: Library) Error!Bitmap {
        var b: c.FT_Bitmap = undefined;
        try intToError(c.FT_Bitmap_Copy(lib.handle, &self.handle, &b));
        return Bitmap{ .handle = b };
    }

    pub fn embolden(self: *Bitmap, lib: Library, x_strength: i32, y_strength: i32) Error!void {
        try intToError(c.FT_Bitmap_Embolden(lib.handle, &self.handle, x_strength, y_strength));
    }

    pub fn convert(self: Bitmap, lib: Library, alignment: u29) Error!Bitmap {
        var b: c.FT_Bitmap = undefined;
        try intToError(c.FT_Bitmap_Convert(lib.handle, &self.handle, &b, alignment));
        return Bitmap{ .handle = b };
    }

    pub fn blend(self: *Bitmap, lib: Library, source_offset: Vector, target_offset: *Vector, color: Color) Error!void {
        var b: c.FT_Bitmap = undefined;
        c.FT_Bitmap_Init(&b);
        try intToError(c.FT_Bitmap_Blend(lib.handle, &self.handle, source_offset, &b, target_offset, color));
    }

    pub fn width(self: Bitmap) u32 {
        return self.handle.width;
    }

    pub fn pitch(self: Bitmap) i32 {
        return self.handle.pitch;
    }

    pub fn rows(self: Bitmap) u32 {
        return self.handle.rows;
    }

    pub fn pixelMode(self: Bitmap) PixelMode {
        return @enumFromInt(self.handle.pixel_mode);
    }

    pub fn buffer(self: Bitmap) ?[]const u8 {
        const buffer_size = @abs(self.pitch()) * self.rows();
        return if (self.handle.buffer == null)
            // freetype returns a null pointer for zero-length allocations
            // https://github.com/hexops-graveyard/freetype/blob/bbd80a52b7b749140ec87d24b6c767c5063be356/freetype/src/base/ftutil.c#L135
            null
        else
            self.handle.buffer[0..buffer_size];
    }
};

pub const BitmapGlyph = struct {
    handle: c.FT_BitmapGlyph,

    pub fn deinit(self: BitmapGlyph) void {
        c.FT_Done_Glyph(@ptrCast(self.handle));
    }

    pub fn left(self: BitmapGlyph) i32 {
        return self.handle.*.left;
    }

    pub fn top(self: BitmapGlyph) i32 {
        return self.handle.*.top;
    }

    pub fn bitmap(self: BitmapGlyph) Bitmap {
        return .{ .handle = self.handle.*.bitmap };
    }
};

pub const Face = struct {
    pub const CharmapIterator = struct {
        face: Face,
        index: u32,
        charcode: u32,

        pub fn init(face: Face) CharmapIterator {
            var i: u32 = 0;
            const cc = c.FT_Get_First_Char(face.handle, &i);
            return .{
                .face = face,
                .index = i,
                .charcode = @intCast(cc),
            };
        }

        pub fn next(self: *CharmapIterator) ?u32 {
            self.charcode = @intCast(c.FT_Get_Next_Char(self.face.handle, self.charcode, &self.index));
            return if (self.index != 0)
                self.charcode
            else
                null;
        }
    };

    handle: c.FT_Face,

    pub fn deinit(self: Face) void {
        _ = c.FT_Done_Face(self.handle);
    }

    pub fn attachFile(self: Face, path: [*:0]const u8) Error!void {
        return self.attachStream(.{
            .flags = .{ .path = true },
            .data = .{ .path = path },
        });
    }

    pub fn attachMemory(self: Face, bytes: []const u8) Error!void {
        return self.attachStream(.{
            .flags = .{ .memory = true },
            .data = .{ .memory = bytes },
        });
    }

    pub fn attachStream(self: Face, args: OpenArgs) Error!void {
        return intToError(c.FT_Attach_Stream(self.handle, &args.cast()));
    }

    pub fn loadGlyph(self: Face, index: u32, flags: LoadFlags) Error!void {
        return intToError(c.FT_Load_Glyph(self.handle, index, @bitCast(flags)));
    }

    pub fn loadChar(self: Face, char: u32, flags: LoadFlags) Error!void {
        return intToError(c.FT_Load_Char(self.handle, char, @bitCast(flags)));
    }

    pub fn setCharSize(self: Face, pt_width: i32, pt_height: i32, horz_resolution: u16, vert_resolution: u16) Error!void {
        return intToError(c.FT_Set_Char_Size(self.handle, pt_width, pt_height, horz_resolution, vert_resolution));
    }

    pub fn setPixelSizes(self: Face, pixel_width: u32, pixel_height: u32) Error!void {
        return intToError(c.FT_Set_Pixel_Sizes(self.handle, pixel_width, pixel_height));
    }

    pub fn requestSize(self: Face, req: SizeRequest) Error!void {
        var req_mut = req;
        return intToError(c.FT_Request_Size(self.handle, &req_mut));
    }

    pub fn selectSize(self: Face, strike_index: i32) Error!void {
        return intToError(c.FT_Select_Size(self.handle, strike_index));
    }

    pub fn setTransform(self: Face, matrix: ?Matrix, delta: ?Vector) Error!void {
        var matrix_mut = matrix;
        var delta_mut = delta;
        return c.FT_Set_Transform(self.handle, if (matrix_mut) |*m| m else null, if (delta_mut) |*d| d else null);
    }

    pub fn getTransform(self: Face) std.meta.Tuple(&.{ Matrix, Vector }) {
        var matrix: Matrix = undefined;
        var delta: Vector = undefined;
        c.FT_Get_Transform(self.handle, &matrix, &delta);
        return .{ matrix, delta };
    }

    pub fn getCharIndex(self: Face, char: u32) ?u32 {
        const i = c.FT_Get_Char_Index(self.handle, char);
        return if (i == 0) null else i;
    }

    pub fn getNameIndex(self: Face, name: [:0]const u8) ?u32 {
        const i = c.FT_Get_Name_Index(self.handle, name.ptr);
        return if (i == 0) null else i;
    }

    pub fn getKerning(self: Face, left_char_index: u32, right_char_index: u32, mode: KerningMode) Error!Vector {
        var kerning: Vector = undefined;
        try intToError(c.FT_Get_Kerning(self.handle, left_char_index, right_char_index, @intFromEnum(mode), &kerning));
        return kerning;
    }

    pub fn getTrackKerning(self: Face, point_size: i32, degree: i32) Error!i32 {
        const kerning: c_long = 0;
        try intToError(c.FT_Get_Track_Kerning(self.handle, point_size, degree, kerning));
        return @intCast(kerning);
    }

    pub fn getGlyphName(self: Face, index: u32, buf: []u8) Error!void {
        try intToError(c.FT_Get_Glyph_Name(self.handle, index, buf.ptr, @intCast(buf.len)));
    }

    pub fn getPostscriptName(self: Face) ?[:0]const u8 {
        return if (c.FT_Get_Postscript_Name(self.handle)) |face_name|
            std.mem.span(@as([*:0]const u8, @ptrCast(face_name)))
        else
            null;
    }

    pub fn iterateCharmap(self: Face) CharmapIterator {
        return CharmapIterator.init(self);
    }

    pub fn selectCharmap(self: Face, encoding: Encoding) Error!void {
        return intToError(c.FT_Select_Charmap(self.handle, @intFromEnum(encoding)));
    }

    pub fn setCharmap(self: Face, char_map: *CharMap) Error!void {
        return intToError(c.FT_Set_Charmap(self.handle, char_map));
    }

    pub fn getFSTypeFlags(self: Face) FSType {
        return @bitCast(c.FT_Get_FSType_Flags(self.handle));
    }

    pub fn getCharVariantIndex(self: Face, char: u32, variant_selector: u32) ?u32 {
        return switch (c.FT_Face_GetCharVariantIndex(self.handle, char, variant_selector)) {
            0 => null,
            else => |i| i,
        };
    }

    pub fn getCharVariantIsDefault(self: Face, char: u32, variant_selector: u32) ?bool {
        return switch (c.FT_Face_GetCharVariantIsDefault(self.handle, char, variant_selector)) {
            -1 => null,
            0 => false,
            1 => true,
            else => unreachable,
        };
    }

    pub fn getVariantSelectors(self: Face) ?[]u32 {
        return if (c.FT_Face_GetVariantSelectors(self.handle)) |chars|
            @ptrCast(std.mem.sliceTo(@as([*:0]u32, @ptrCast(chars)), 0))
        else
            null;
    }

    pub fn getVariantsOfChar(self: Face, char: u32) ?[]u32 {
        return if (c.FT_Face_GetVariantsOfChar(self.handle, char)) |variants|
            @ptrCast(std.mem.sliceTo(@as([*:0]u32, @ptrCast(variants)), 0))
        else
            null;
    }

    pub fn getCharsOfVariant(self: Face, variant_selector: u32) ?[]u32 {
        return if (c.FT_Face_GetCharsOfVariant(self.handle, variant_selector)) |chars|
            @ptrCast(std.mem.sliceTo(@as([*:0]u32, @ptrCast(chars)), 0))
        else
            null;
    }

    pub fn getPaletteData(self: Face) Error!PaletteData {
        var p: c.FT_Palette_Data = undefined;
        try intToError(c.FT_Palette_Data_Get(self.handle, &p));
        return PaletteData{ .handle = p };
    }

    fn selectPalette(self: Face, index: u16) Error!?[]const Color {
        var color: [*:0]Color = undefined;
        try intToError(c.FT_Palette_Select(self.handle, index, &color));
        const pd = try getPaletteData();
        return self.color[0..pd.numPaletteEntries()];
    }

    pub fn setPaletteForegroundColor(self: Face, color: Color) Error!void {
        try intToError(c.FT_Palette_Set_Foreground_Color(self.handle, color));
    }

    pub fn getGlyphLayersIterator(self: Face, glyph_index: u32) GlyphLayersIterator {
        return GlyphLayersIterator.init(self, glyph_index);
    }

    pub fn getColorGlyphPaint(self: Face, base_glyph: u32, root_transform: RootTransform) ?Paint {
        var opaque_paint: OpaquePaint = undefined;
        if (c.FT_Get_Color_Glyph_Paint(self.handle, base_glyph, @intFromEnum(root_transform), &opaque_paint) == 0)
            return null;
        return self.getPaint(opaque_paint);
    }

    pub fn getColorGlyphClibBox(self: Face, base_glyph: u32) ?ClipBox {
        var clib_box: ClipBox = undefined;
        if (c.FT_Get_Color_Glyph_ClipBox(self.handle, base_glyph, &clib_box) == 0)
            return null;
        return clib_box;
    }

    pub fn getPaint(self: Face, opaque_paint: OpaquePaint) ?Paint {
        var p: c.FT_COLR_Paint = undefined;
        if (c.FT_Get_Paint(self.handle, opaque_paint, &p) == 0)
            return null;
        return switch (@as(PaintFormat, @enumFromInt(p.format))) {
            .color_layers => Paint{ .color_layers = p.u.colr_layers },
            .glyph => Paint{ .glyph = p.u.glyph },
            .solid => Paint{ .solid = p.u.solid },
            .linear_gradient => Paint{ .linear_gradient = p.u.linear_gradient },
            .radial_gradient => Paint{ .radial_gradient = p.u.radial_gradient },
            .sweep_gradient => Paint{ .sweep_gradient = p.u.sweep_gradient },
            .transform => Paint{ .transform = p.u.transform },
            .translate => Paint{ .translate = p.u.translate },
            .scale => Paint{ .scale = p.u.scale },
            .rotate => Paint{ .rotate = p.u.rotate },
            .skew => Paint{ .skew = p.u.skew },
            .composite => Paint{ .composite = p.u.composite },
            .color_glyph => Paint{ .color_glyph = p.u.colr_glyph },
        };
    }

    pub fn newSize(self: Face) Error!Size {
        var s: c.FT_Size = undefined;
        try intToError(c.FT_New_Size(self.handle, &s));
        return Size{ .handle = s };
    }

    pub fn numFaces(self: Face) u32 {
        return @intCast(self.handle.*.num_faces);
    }

    pub fn faceIndex(self: Face) u32 {
        return @intCast(self.handle.*.face_index);
    }

    pub fn faceFlags(self: Face) FaceFlags {
        return @bitCast(self.handle.*.face_flags);
    }

    pub fn styleFlags(self: Face) StyleFlags {
        return @bitCast(self.handle.*.style_flags);
    }

    pub fn numGlyphs(self: Face) u32 {
        return @intCast(self.handle.*.num_glyphs);
    }

    pub fn familyName(self: Face) ?[:0]const u8 {
        return if (self.handle.*.family_name) |family|
            std.mem.span(@as([*:0]const u8, @ptrCast(family)))
        else
            null;
    }

    pub fn styleName(self: Face) ?[:0]const u8 {
        return if (self.handle.*.style_name) |style_name|
            std.mem.span(@as([*:0]const u8, @ptrCast(style_name)))
        else
            null;
    }

    pub fn numFixedSizes(self: Face) u32 {
        return @intCast(self.handle.*.num_fixed_sizes);
    }

    pub fn availableSizes(self: Face) []BitmapSize {
        return if (self.handle.*.available_sizes != null)
            self.handle.*.available_sizes[0..self.numFixedSizes()]
        else
            &.{};
    }

    pub fn getAdvance(self: Face, glyph_index: u32, load_flags: LoadFlags) Error!i32 {
        var a: c_long = 0;
        try intToError(c.FT_Get_Advance(self.handle, glyph_index, @bitCast(load_flags), &a));
        return @intCast(a);
    }

    pub fn getAdvances(self: Face, start: u32, advances_out: []c_long, load_flags: LoadFlags) Error!void {
        try intToError(c.FT_Get_Advances(self.handle, start, @intCast(advances_out.len), @bitCast(load_flags), advances_out.ptr));
    }

    pub fn numCharmaps(self: Face) u32 {
        return @intCast(self.handle.*.num_charmaps);
    }

    pub fn charmaps(self: Face) []const CharMap {
        return @as([*]const CharMap, @ptrCast(self.handle.*.charmaps))[0..self.numCharmaps()];
    }

    pub fn bbox(self: Face) BBox {
        return self.handle.*.bbox;
    }

    pub fn unitsPerEM(self: Face) u16 {
        return self.handle.*.units_per_EM;
    }

    pub fn ascender(self: Face) i16 {
        return self.handle.*.ascender;
    }

    pub fn descender(self: Face) i16 {
        return self.handle.*.descender;
    }

    pub fn height(self: Face) i16 {
        return self.handle.*.height;
    }

    pub fn maxAdvanceWidth(self: Face) i16 {
        return self.handle.*.max_advance_width;
    }

    pub fn maxAdvanceHeight(self: Face) i16 {
        return self.handle.*.max_advance_height;
    }

    pub fn underlinePosition(self: Face) i16 {
        return self.handle.*.underline_position;
    }

    pub fn underlineThickness(self: Face) i16 {
        return self.handle.*.underline_thickness;
    }

    pub fn glyph(self: Face) GlyphSlot {
        return .{ .handle = self.handle.*.glyph };
    }

    pub fn size(self: Face) Size {
        return Size{ .handle = self.handle.*.size };
    }

    pub fn charmap(self: Face) CharMap {
        return self.handle.*.charmap.*;
    }

    pub fn hasHorizontal(self: Face) bool {
        return c.FT_HAS_HORIZONTAL(self.handle);
    }

    pub fn hasVertical(self: Face) bool {
        return c.FT_HAS_VERTICAL(self.handle);
    }

    pub fn hasKerning(self: Face) bool {
        return c.FT_HAS_KERNING(self.handle);
    }

    pub fn hasFixedSizes(self: Face) bool {
        return c.FT_HAS_FIXED_SIZES(self.handle);
    }

    pub fn hasGlyphNames(self: Face) bool {
        return c.FT_HAS_GLYPH_NAMES(self.handle);
    }

    pub fn hasColor(self: Face) bool {
        return c.FT_HAS_COLOR(self.handle);
    }

    pub fn isScalable(self: Face) bool {
        return c.FT_IS_SCALABLE(self.handle);
    }

    pub fn isSfnt(self: Face) bool {
        return c.FT_IS_SFNT(self.handle);
    }

    pub fn isFixedWidth(self: Face) bool {
        return c.FT_IS_FIXED_WIDTH(self.handle);
    }

    pub fn isCidKeyed(self: Face) bool {
        return c.FT_IS_CID_KEYED(self.handle);
    }

    pub fn isTricky(self: Face) bool {
        return c.FT_IS_TRICKY(self.handle);
    }
};

pub const Glyph = struct {
    handle: c.FT_Glyph,

    pub fn deinit(self: Glyph) void {
        c.FT_Done_Glyph(self.handle);
    }

    pub fn newGlyph(library: Library, glyph_format: GlyphFormat) Glyph {
        var g: c.FT_Glyph = undefined;
        return .{
            .handle = c.FT_New_Glyph(library.handle, @intFromEnum(glyph_format), &g),
        };
    }

    pub fn copy(self: Glyph) Error!Glyph {
        var g: c.FT_Glyph = undefined;
        try intToError(c.FT_Glyph_Copy(self.handle, &g));
        return Glyph{ .handle = g };
    }

    pub fn transform(self: Glyph, matrix: ?Matrix, delta: ?Vector) Error!void {
        try intToError(c.FT_Glyph_Transform(self.handle, if (matrix) |m| &m else null, if (delta) |d| &d else null));
    }

    pub fn getCBox(self: Glyph, bbox_mode: BBoxMode) BBox {
        var b: BBox = undefined;
        c.FT_Glyph_Get_CBox(self.handle, @intFromEnum(bbox_mode), &b);
        return b;
    }

    pub fn toBitmapGlyph(self: *Glyph, render_mode: RenderMode, origin: ?Vector) Error!BitmapGlyph {
        try intToError(c.FT_Glyph_To_Bitmap(&self.handle, @intFromEnum(render_mode), if (origin) |o| &o else null, 1));
        return BitmapGlyph{ .handle = @ptrCast(self.handle) };
    }

    pub fn copyBitmapGlyph(self: *Glyph, render_mode: RenderMode, origin: ?Vector) Error!BitmapGlyph {
        try intToError(c.FT_Glyph_To_Bitmap(&self.handle, @intFromEnum(render_mode), if (origin) |o| &o else null, 0));
        return BitmapGlyph{ .handle = @ptrCast(self.handle) };
    }

    pub fn castBitmapGlyph(self: Glyph) Error!BitmapGlyph {
        return BitmapGlyph{ .handle = @ptrCast(self.handle) };
    }

    pub fn castOutlineGlyph(self: Glyph) Error!OutlineGlyph {
        return OutlineGlyph{ .handle = @ptrCast(self.handle) };
    }

    pub fn castSvgGlyph(self: Glyph) Error!SvgGlyph {
        return SvgGlyph{ .handle = @ptrCast(self.handle) };
    }

    pub fn stroke(self: *Glyph, stroker: Stroker) Error!void {
        try intToError(c.FT_Glyph_Stroke(&self.handle, stroker.handle, 0));
    }

    pub fn strokeBorder(self: *Glyph, stroker: Stroker, inside: bool) Error!void {
        try intToError(c.FT_Glyph_StrokeBorder(&self.handle, stroker.handle, if (inside) 1 else 0, 0));
    }

    pub fn format(self: Glyph) GlyphFormat {
        return @enumFromInt(self.handle.*.format);
    }

    pub fn advanceX(self: Glyph) isize {
        return self.handle.*.advance.x;
    }

    pub fn advanceY(self: Glyph) isize {
        return self.handle.*.advance.y;
    }
};

pub const GlyphLayersIterator = struct {
    face: Face,
    glyph_index: u32,
    layer_glyph_index: u32,
    layer_color_index: u32,
    iterator: LayerIterator,

    pub fn init(face: Face, glyph_index: u32) GlyphLayersIterator {
        var iterator: LayerIterator = undefined;
        iterator.p = null;
        return .{
            .face = face,
            .glyph_index = glyph_index,
            .layer_glyph_index = 0,
            .layer_color_index = 0,
            .iterator = iterator,
        };
    }

    pub fn next(self: *GlyphLayersIterator) bool {
        return if (c.FT_Get_Color_Glyph_Layer(
            self.face.handle,
            self.glyph_index,
            &self.layer_glyph_index,
            &self.layer_color_index,
            &self.iterator,
        ) == 0) false else true;
    }
};

pub const GlyphSlot = struct {
    pub const SubGlyphInfo = struct {
        index: i32,
        flags: c_uint,
        arg1: i32,
        arg2: i32,
        transform: Matrix,
    };

    handle: c.FT_GlyphSlot,

    pub fn library(self: GlyphSlot) Library {
        return .{ .handle = self.handle.*.library };
    }

    pub fn face(self: GlyphSlot) Face {
        return .{ .handle = self.handle.*.face };
    }

    pub fn next(self: GlyphSlot) GlyphSlot {
        return .{ .handle = self.handle.*.next };
    }

    pub fn glyphIndex(self: GlyphSlot) u32 {
        return self.handle.*.glyph_index;
    }

    pub fn metrics(self: GlyphSlot) GlyphMetrics {
        return self.handle.*.metrics;
    }

    pub fn linearHoriAdvance(self: GlyphSlot) i32 {
        return @intCast(self.handle.*.linearHoriAdvance);
    }

    pub fn linearVertAdvance(self: GlyphSlot) i32 {
        return @intCast(self.handle.*.linearVertAdvance);
    }

    pub fn advance(self: GlyphSlot) Vector {
        return self.handle.*.advance;
    }

    pub fn format(self: GlyphSlot) GlyphFormat {
        return @enumFromInt(self.handle.*.format);
    }

    pub fn ownBitmap(self: GlyphSlot) Error!void {
        try intToError(c.FT_GlyphSlot_Own_Bitmap(self.handle));
    }

    pub fn bitmap(self: GlyphSlot) Bitmap {
        return .{ .handle = self.handle.*.bitmap };
    }

    pub fn bitmapLeft(self: GlyphSlot) i32 {
        return self.handle.*.bitmap_left;
    }

    pub fn bitmapTop(self: GlyphSlot) i32 {
        return self.handle.*.bitmap_top;
    }

    pub fn outline(self: GlyphSlot) ?Outline {
        return if (self.format() == .outline) .{ .handle = &self.handle.*.outline } else null;
    }

    pub fn lsbDelta(self: GlyphSlot) i32 {
        return @intCast(self.handle.*.lsb_delta);
    }

    pub fn rsbDelta(self: GlyphSlot) i32 {
        return @intCast(self.handle.*.rsb_delta);
    }

    pub fn render(self: GlyphSlot, render_mode: RenderMode) Error!void {
        return intToError(c.FT_Render_Glyph(self.handle, @intFromEnum(render_mode)));
    }

    pub fn adjustWeight(self: GlyphSlot, x_delta: i32, y_delta: i32) void {
        return c.FT_GlyphSlot_AdjustWeight(self.handle, x_delta, y_delta);
    }

    pub fn slant(self: GlyphSlot, x_slant: i32, y_slant: i32) void {
        return c.FT_GlyphSlot_Slant(self.handle, x_slant, y_slant);
    }

    pub fn getSubGlyphInfo(self: GlyphSlot, sub_index: u32) Error!SubGlyphInfo {
        var info: SubGlyphInfo = undefined;
        try intToError(c.FT_Get_SubGlyph_Info(self.handle, sub_index, &info.index, &info.flags, &info.arg1, &info.arg2, &info.transform));
        return info;
    }

    pub fn getGlyph(self: GlyphSlot) Error!Glyph {
        var res: c.FT_Glyph = undefined;
        try intToError(c.FT_Get_Glyph(self.handle, &res));
        return Glyph{ .handle = res };
    }
};

pub const Library = struct {
    pub const Version = struct {
        major: i32,
        minor: i32,
        patch: i32,
    };

    handle: c.FT_Library,

    pub fn init() Error!Library {
        var lib = Library{ .handle = undefined };
        try intToError(c.FT_Init_FreeType(&lib.handle));
        return lib;
    }

    pub fn deinit(self: Library) void {
        _ = c.FT_Done_FreeType(self.handle);
    }

    pub fn createFace(self: Library, path: [*:0]const u8, face_index: i32) Error!Face {
        return self.openFace(.{
            .flags = .{ .path = true },
            .data = .{ .path = path },
        }, face_index);
    }

    pub fn createFaceMemory(self: Library, bytes: []const u8, face_index: i32) Error!Face {
        return self.openFace(.{
            .flags = .{ .memory = true },
            .data = .{ .memory = bytes },
        }, face_index);
    }

    pub fn openFace(self: Library, args: OpenArgs, face_index: i32) Error!Face {
        var f: c.FT_Face = undefined;
        try intToError(c.FT_Open_Face(self.handle, &args.cast(), face_index, &f));
        return Face{ .handle = f };
    }

    pub fn version(self: Library) Version {
        var v: Version = undefined;
        c.FT_Library_Version(
            self.handle,
            &v.major,
            &v.minor,
            &v.patch,
        );
        return v;
    }

    pub fn createStroker(self: Library) Error!Stroker {
        var s: c.FT_Stroker = undefined;
        try intToError(c.FT_Stroker_New(self.handle, &s));
        return Stroker{ .handle = s };
    }

    pub fn createOutlineFromBitmap(self: Library, bitmap: Bitmap) Error!Outline {
        const o: Outline = undefined;
        try intToError(c.FT_Outline_Get_Bitmap(self.handle, o.handle, &bitmap.handle));
        return o;
    }

    pub fn renderOutline(self: Library, outline: Outline, params: *Raster.Params) Error!void {
        try intToError(c.FT_Outline_Render(self.handle, outline.handle, @ptrCast(params)));
    }

    pub fn setLcdFilter(self: Library, lcd_filter: LcdFilter) Error!void {
        return intToError(c.FT_Library_SetLcdFilter(self.handle, @intFromEnum(lcd_filter)));
    }
};

pub const OpenArgs = struct {
    flags: OpenFlags,
    data: union(enum) {
        memory: []const u8,
        path: [*:0]const u8,
        stream: c.FT_Stream,
        driver: c.FT_Module,
        params: []const c.FT_Parameter,
    },

    pub fn cast(self: OpenArgs) c.FT_Open_Args {
        var oa: c.FT_Open_Args = undefined;
        oa.flags = @bitCast(self.flags);
        switch (self.data) {
            .memory => |d| {
                oa.memory_base = d.ptr;
                oa.memory_size = @intCast(d.len);
            },
            // The Freetype API requires a mutable string.
            // This is an oversight, Freetype actually never writes to this string.
            .path => |d| oa.pathname = @constCast(d),
            .stream => |d| oa.stream = d,
            .driver => |d| oa.driver = d,
            .params => |*d| {
                oa.params = @constCast(d.ptr);
                oa.num_params = @intCast(d.len);
            },
        }
        return oa;
    }
};

pub const Outline = struct {
    pub const Orientation = enum(u2) {
        truetype = c.FT_ORIENTATION_TRUETYPE,
        postscript = c.FT_ORIENTATION_POSTSCRIPT,
        none = c.FT_ORIENTATION_NONE,
    };

    pub const Flags = packed struct(c_int) {
        owner: bool = false,
        even_odd_fill: bool = false,
        reverse_fill: bool = false,
        ignore_dropouts: bool = false,
        smart_dropouts: bool = false,
        include_stubs: bool = false,
        overlap: bool = false,
        _padding: u1 = 0,
        high_precision: bool = false,
        single_pass: bool = false,
        _padding0: u22 = 0,
    };

    handle: *c.FT_Outline,

    pub fn numPoints(self: Outline) u15 {
        return @intCast(self.handle.*.n_points);
    }

    pub fn numContours(self: Outline) u15 {
        return @intCast(self.handle.*.n_contours);
    }

    pub fn points(self: Outline) []const Vector {
        return self.handle.*.points[0..self.numPoints()];
    }

    pub fn tags(self: Outline) []const u8 {
        return self.handle.tags[0..@intCast(self.handle.n_points)];
    }

    pub fn contours(self: Outline) []const i16 {
        return self.handle.*.contours[0..self.numContours()];
    }

    pub fn flags(self: Outline) Flags {
        return @bitCast(self.handle.*.flags);
    }

    pub fn copy(self: Outline) Error!Outline {
        var o: c.FT_Outline = undefined;
        try intToError(c.FT_Outline_Copy(self.handle, &o));
        return Outline{ .handle = &o };
    }

    pub fn translate(self: Outline, x_offset: i32, y_offset: i32) void {
        c.FT_Outline_Translate(self.handle, x_offset, y_offset);
    }

    pub fn transform(self: Outline, matrix: ?Matrix) void {
        c.FT_Outline_Transform(self.handle, if (matrix) |m| &m else null);
    }

    pub fn embolden(self: Outline, strength: i32) Error!void {
        try intToError(c.FT_Outline_Embolden(self.handle, strength));
    }

    pub fn emboldenXY(self: Outline, x_strength: i32, y_strength: i32) Error!void {
        try intToError(c.FT_Outline_EmboldenXY(self.handle, x_strength, y_strength));
    }

    pub fn reverse(self: Outline) void {
        c.FT_Outline_Reverse(self.handle);
    }

    pub fn check(self: Outline) Error!void {
        try intToError(c.FT_Outline_Check(self.handle));
    }

    pub fn cbox(self: Outline) BBox {
        var b: BBox = undefined;
        c.FT_Outline_Get_CBox(self.handle, &b);
        return b;
    }

    pub fn bbox(self: Outline) Error!BBox {
        var b: BBox = undefined;
        try intToError(c.FT_Outline_Get_BBox(self.handle, &b));
        return b;
    }

    pub fn orientation(self: Outline) Orientation {
        return @enumFromInt(c.FT_Outline_Get_Orientation(self.handle));
    }

    pub fn getInsideBorder(self: Outline) Border {
        return @enumFromInt(c.FT_Outline_GetInsideBorder(self.handle));
    }

    pub fn getOutsideBorder(self: Outline) Border {
        return @enumFromInt(c.FT_Outline_GetOutsideBorder(self.handle));
    }

    pub fn Funcs(comptime Context: type) type {
        return struct {
            move_to: *const fn (ctx: Context, to: Vector) Error!void,
            line_to: *const fn (ctx: Context, to: Vector) Error!void,
            conic_to: *const fn (ctx: Context, control: Vector, to: Vector) Error!void,
            cubic_to: *const fn (ctx: Context, control_0: Vector, control_1: Vector, to: Vector) Error!void,
            shift: i32,
            delta: i32,
        };
    }

    fn FuncsWrapper(comptime Context: type) type {
        return struct {
            const Self = @This();
            ctx: Context,
            callbacks: Funcs(Context),

            fn getSelf(ptr: ?*anyopaque) *Self {
                return @ptrCast(@alignCast(ptr));
            }

            pub fn move_to(to: [*c]const c.FT_Vector, ctx: ?*anyopaque) callconv(.C) c_int {
                const self = getSelf(ctx);
                return if (self.callbacks.move_to(self.ctx, to.*)) |_|
                    0
                else |err|
                    errorToInt(err);
            }

            pub fn line_to(to: [*c]const c.FT_Vector, ctx: ?*anyopaque) callconv(.C) c_int {
                const self = getSelf(ctx);
                return if (self.callbacks.line_to(self.ctx, to.*)) |_|
                    0
                else |err|
                    errorToInt(err);
            }

            pub fn conic_to(
                control: [*c]const c.FT_Vector,
                to: [*c]const c.FT_Vector,
                ctx: ?*anyopaque,
            ) callconv(.C) c_int {
                const self = getSelf(ctx);
                return if (self.callbacks.conic_to(
                    self.ctx,
                    control.*,
                    to.*,
                )) |_|
                    0
                else |err|
                    errorToInt(err);
            }

            pub fn cubic_to(
                control_0: [*c]const c.FT_Vector,
                control_1: [*c]const c.FT_Vector,
                to: [*c]const c.FT_Vector,
                ctx: ?*anyopaque,
            ) callconv(.C) c_int {
                const self = getSelf(ctx);
                return if (self.callbacks.cubic_to(
                    self.ctx,
                    control_0.*,
                    control_1.*,
                    to.*,
                )) |_|
                    0
                else |err|
                    errorToInt(err);
            }
        };
    }

    pub fn decompose(self: Outline, ctx: anytype, callbacks: Funcs(@TypeOf(ctx))) Error!void {
        var wrapper = FuncsWrapper(@TypeOf(ctx)){ .ctx = ctx, .callbacks = callbacks };
        try intToError(c.FT_Outline_Decompose(
            self.handle,
            &c.FT_Outline_Funcs{
                .move_to = @TypeOf(wrapper).move_to,
                .line_to = @TypeOf(wrapper).line_to,
                .conic_to = @TypeOf(wrapper).conic_to,
                .cubic_to = @TypeOf(wrapper).cubic_to,
                .shift = callbacks.shift,
                .delta = callbacks.delta,
            },
            &wrapper,
        ));
    }
};

pub const OutlineGlyph = struct {
    handle: c.FT_OutlineGlyph,

    pub fn deinit(self: OutlineGlyph) void {
        c.FT_Done_Glyph(@ptrCast(self.handle));
    }

    pub fn outline(self: OutlineGlyph) Outline {
        return .{ .handle = &self.handle.*.outline };
    }
};

pub const PaletteData = struct {
    handle: c.FT_Palette_Data,

    pub fn numPalettes(self: PaletteData) u16 {
        return self.handle.num_palettes;
    }

    pub fn paletteNameIDs(self: PaletteData) ?[]const u16 {
        return self.handle.palette_name_ids[0..self.numPalettes()];
    }

    pub fn paletteFlags(self: PaletteData) ?[]const u16 {
        return self.handle.palette_flags[0..self.numPalettes()];
    }

    pub fn paletteFlag(self: PaletteData, index: u32) PaletteFlags {
        return @bitCast(self.handle.palette_flags[index]);
    }

    pub fn numPaletteEntries(self: PaletteData) u16 {
        return self.handle.num_palette_entries;
    }

    pub fn paletteEntryNameIDs(self: PaletteData) ?[]const u16 {
        return self.handle.palette_entry_name_ids[0..self.numPaletteEntries()];
    }
};

pub const Raster = struct {
    handle: c.FT_Raster,

    pub const NewFunc = *const fn (memory: ?*anyopaque, raster: [*c]c.FT_Raster) callconv(.C) c_int;
    pub const DoneFunc = *const fn (raster: [*c]c.FT_Raster) callconv(.C) void;
    pub const ResetFunc = *const fn (raster: c.FT_Raster, pool_base: [*c]u8, pool_size: c_ulong) callconv(.C) void;
    pub const SetModeFunc = *const fn (raster: c.FT_Raster, mode: c_ulong, args: ?*anyopaque) callconv(.C) c_int;
    pub const RenderFunc = *const fn (raster: c.FT_Raster, params: Params) callconv(.C) c_int;
    pub const BitTestFunc = *const fn (y: c_int, x: c_int, user: ?*anyopaque) callconv(.C) c_int;
    pub const BitSetFunc = *const fn (y: c_int, x: c_int, user: ?*anyopaque) callconv(.C) void;
    pub const SpanFunc = *const fn (y: c_int, count: c_int, spans: [*]const Span, user: *anyopaque) callconv(.C) void;

    pub const Params = extern struct {
        target: [*c]const c.FT_Bitmap,
        source: [*]const u8,
        flags: Flags,
        gray_spans: SpanFunc,
        black_spans: ?SpanFunc = null, // unused
        bit_test: ?BitTestFunc = null, // unused
        bit_set: ?BitSetFunc = null, // unused
        user: ?*anyopaque = null,
        clip_box: BBox,
    };

    pub const Flags = packed struct(c_int) {
        aa: bool = false,
        direct: bool = false,
        clip: bool = false,
        sdf: bool = false,
        _padding: u28 = 0,
    };
};

pub const Size = struct {
    handle: c.FT_Size,

    pub fn face(self: Size) Face {
        return Face{ .handle = self.handle.*.face };
    }

    pub fn generic(self: Size) Generic {
        return self.handle.*.generic;
    }

    pub fn metrics(self: Size) SizeMetrics {
        return self.handle.*.metrics;
    }

    pub fn activate(self: Size) Error!void {
        try intToError(c.FT_Activate_Size(self.handle));
    }

    pub fn deinit(self: Size) void {
        intToError(c.FT_Done_Size(self.handle)) catch |err| {
            std.log.err("mach/freetype: Failed to destroy Size: {}", .{err});
        };
    }
};

pub const Stroker = struct {
    pub const BorderCounts = struct {
        points: u32,
        contours: u32,
    };

    handle: c.FT_Stroker,

    pub fn set(self: Stroker, radius: i32, line_cap: LineCap, line_join: LineJoin, miter_limit: i32) void {
        c.FT_Stroker_Set(self.handle, radius, @intFromEnum(line_cap), @intFromEnum(line_join), miter_limit);
    }

    pub fn rewind(self: Stroker) void {
        c.FT_Stroker_Rewind(self.handle);
    }

    pub fn parseOutline(self: Stroker, outline: Outline, opened: bool) Error!void {
        try intToError(c.FT_Stroker_ParseOutline(self.handle, outline.handle, if (opened) 1 else 0));
    }

    pub fn beginSubPath(self: Stroker, to: *Vector, open: bool) Error!void {
        try intToError(c.FT_Stroker_BeginSubPath(self.handle, to, if (open) 1 else 0));
    }

    pub fn endSubPath(self: Stroker) Error!void {
        try intToError(c.FT_Stroker_EndSubPath(self.handle));
    }

    pub fn lineTo(self: Stroker, to: *Vector) Error!void {
        try intToError(c.FT_Stroker_LineTo(self.handle, to));
    }

    pub fn conicTo(self: Stroker, control: *Vector, to: *Vector) Error!void {
        try intToError(c.FT_Stroker_ConicTo(self.handle, control, to));
    }

    pub fn cubicTo(self: Stroker, control_0: *Vector, control_1: *Vector, to: *Vector) Error!void {
        try intToError(c.FT_Stroker_CubicTo(self.handle, control_0, control_1, to));
    }

    pub fn getBorderCounts(self: Stroker, border: Border) Error!BorderCounts {
        var counts: BorderCounts = undefined;
        try intToError(c.FT_Stroker_GetBorderCounts(self.handle, @intFromEnum(border), &counts.points, &counts.contours));
        return counts;
    }

    pub fn exportBorder(self: Stroker, border: Border, outline: *Outline) void {
        c.FT_Stroker_ExportBorder(self.handle, @intFromEnum(border), outline.handle);
    }

    pub fn getCounts(self: Stroker) Error!BorderCounts {
        var counts: BorderCounts = undefined;
        try intToError(c.FT_Stroker_GetCounts(self.handle, &counts.points, &counts.contours));
        return counts;
    }

    pub fn exportAll(self: Stroker, outline: *Outline) void {
        c.FT_Stroker_Export(self.handle, outline.handle);
    }

    pub fn deinit(self: Stroker) void {
        c.FT_Stroker_Done(self.handle);
    }
};

pub const SvgGlyph = struct {
    handle: c.FT_SvgGlyph,

    pub fn deinit(self: SvgGlyph) void {
        c.FT_Done_Glyph(@ptrCast(self.handle));
    }

    pub fn svgBuffer(self: SvgGlyph) []const u8 {
        return self.handle.*.svg_document[0..self.svgBufferLen()];
    }

    pub fn svgBufferLen(self: SvgGlyph) u32 {
        return @intCast(self.handle.*.svg_document_length);
    }

    pub fn glyphIndex(self: SvgGlyph) u32 {
        return @intCast(self.handle.*.glyph_index);
    }

    pub fn metrics(self: SvgGlyph) SizeMetrics {
        return self.handle.*.metrics;
    }

    pub fn unitsPerEM(self: SvgGlyph) u16 {
        return self.handle.*.units_per_EM;
    }

    pub fn startGlyphID(self: SvgGlyph) u16 {
        return self.handle.*.start_glyph_id;
    }

    pub fn endGlyphID(self: SvgGlyph) u16 {
        return self.handle.*.end_glyph_id;
    }

    pub fn transform(self: SvgGlyph) Matrix {
        return self.handle.*.transform;
    }

    pub fn delta(self: SvgGlyph) Vector {
        return self.handle.*.delta;
    }
};

pub const Error = error{
    CannotOpenResource,
    UnknownFileFormat,
    InvalidFileFormat,
    InvalidVersion,
    LowerModuleVersion,
    InvalidArgument,
    UnimplementedFeature,
    InvalidTable,
    InvalidOffset,
    ArrayTooLarge,
    MissingModule,
    MissingProperty,
    InvalidGlyphIndex,
    InvalidCharacterCode,
    InvalidGlyphFormat,
    CannotRenderGlyph,
    InvalidOutline,
    InvalidComposite,
    TooManyHints,
    InvalidPixelSize,
    InvalidHandle,
    InvalidLibraryHandle,
    InvalidDriverHandle,
    InvalidFaceHandle,
    InvalidSizeHandle,
    InvalidSlotHandle,
    InvalidCharMapHandle,
    InvalidCacheHandle,
    InvalidStreamHandle,
    TooManyDrivers,
    TooManyExtensions,
    OutOfMemory,
    UnlistedObject,
    CannotOpenStream,
    InvalidStreamSeek,
    InvalidStreamSkip,
    InvalidStreamRead,
    InvalidStreamOperation,
    InvalidFrameOperation,
    NestedFrameAccess,
    InvalidFrameRead,
    RasterUninitialized,
    RasterCorrupted,
    RasterOverflow,
    RasterNegativeHeight,
    TooManyCaches,
    InvalidOpcode,
    TooFewArguments,
    StackOverflow,
    CodeOverflow,
    BadArgument,
    DivideByZero,
    InvalidReference,
    DebugOpCode,
    ENDFInExecStream,
    NestedDEFS,
    InvalidCodeRange,
    ExecutionTooLong,
    TooManyFunctionDefs,
    TooManyInstructionDefs,
    TableMissing,
    HorizHeaderMissing,
    LocationsMissing,
    NameTableMissing,
    CMapTableMissing,
    HmtxTableMissing,
    PostTableMissing,
    InvalidHorizMetrics,
    InvalidCharMapFormat,
    InvalidPPem,
    InvalidVertMetrics,
    CouldNotFindContext,
    InvalidPostTableFormat,
    InvalidPostTable,
    Syntax,
    StackUnderflow,
    Ignore,
    NoUnicodeGlyphName,
    MissingStartfontField,
    MissingFontField,
    MissingSizeField,
    MissingFontboundingboxField,
    MissingCharsField,
    MissingStartcharField,
    MissingEncodingField,
    MissingBbxField,
    BbxTooBig,
    CorruptedFontHeader,
    CorruptedFontGlyphs,
};

pub fn intToError(err: c_int) Error!void {
    return switch (err) {
        c.FT_Err_Ok => {},
        c.FT_Err_Cannot_Open_Resource => Error.CannotOpenResource,
        c.FT_Err_Unknown_File_Format => Error.UnknownFileFormat,
        c.FT_Err_Invalid_File_Format => Error.InvalidFileFormat,
        c.FT_Err_Invalid_Version => Error.InvalidVersion,
        c.FT_Err_Lower_Module_Version => Error.LowerModuleVersion,
        c.FT_Err_Invalid_Argument => Error.InvalidArgument,
        c.FT_Err_Unimplemented_Feature => Error.UnimplementedFeature,
        c.FT_Err_Invalid_Table => Error.InvalidTable,
        c.FT_Err_Invalid_Offset => Error.InvalidOffset,
        c.FT_Err_Array_Too_Large => Error.ArrayTooLarge,
        c.FT_Err_Missing_Module => Error.MissingModule,
        c.FT_Err_Missing_Property => Error.MissingProperty,
        c.FT_Err_Invalid_Glyph_Index => Error.InvalidGlyphIndex,
        c.FT_Err_Invalid_Character_Code => Error.InvalidCharacterCode,
        c.FT_Err_Invalid_Glyph_Format => Error.InvalidGlyphFormat,
        c.FT_Err_Cannot_Render_Glyph => Error.CannotRenderGlyph,
        c.FT_Err_Invalid_Outline => Error.InvalidOutline,
        c.FT_Err_Invalid_Composite => Error.InvalidComposite,
        c.FT_Err_Too_Many_Hints => Error.TooManyHints,
        c.FT_Err_Invalid_Pixel_Size => Error.InvalidPixelSize,
        c.FT_Err_Invalid_Handle => Error.InvalidHandle,
        c.FT_Err_Invalid_Library_Handle => Error.InvalidLibraryHandle,
        c.FT_Err_Invalid_Driver_Handle => Error.InvalidDriverHandle,
        c.FT_Err_Invalid_Face_Handle => Error.InvalidFaceHandle,
        c.FT_Err_Invalid_Size_Handle => Error.InvalidSizeHandle,
        c.FT_Err_Invalid_Slot_Handle => Error.InvalidSlotHandle,
        c.FT_Err_Invalid_CharMap_Handle => Error.InvalidCharMapHandle,
        c.FT_Err_Invalid_Cache_Handle => Error.InvalidCacheHandle,
        c.FT_Err_Invalid_Stream_Handle => Error.InvalidStreamHandle,
        c.FT_Err_Too_Many_Drivers => Error.TooManyDrivers,
        c.FT_Err_Too_Many_Extensions => Error.TooManyExtensions,
        c.FT_Err_Out_Of_Memory => Error.OutOfMemory,
        c.FT_Err_Unlisted_Object => Error.UnlistedObject,
        c.FT_Err_Cannot_Open_Stream => Error.CannotOpenStream,
        c.FT_Err_Invalid_Stream_Seek => Error.InvalidStreamSeek,
        c.FT_Err_Invalid_Stream_Skip => Error.InvalidStreamSkip,
        c.FT_Err_Invalid_Stream_Read => Error.InvalidStreamRead,
        c.FT_Err_Invalid_Stream_Operation => Error.InvalidStreamOperation,
        c.FT_Err_Invalid_Frame_Operation => Error.InvalidFrameOperation,
        c.FT_Err_Nested_Frame_Access => Error.NestedFrameAccess,
        c.FT_Err_Invalid_Frame_Read => Error.InvalidFrameRead,
        c.FT_Err_Raster_Uninitialized => Error.RasterUninitialized,
        c.FT_Err_Raster_Corrupted => Error.RasterCorrupted,
        c.FT_Err_Raster_Overflow => Error.RasterOverflow,
        c.FT_Err_Raster_Negative_Height => Error.RasterNegativeHeight,
        c.FT_Err_Too_Many_Caches => Error.TooManyCaches,
        c.FT_Err_Invalid_Opcode => Error.InvalidOpcode,
        c.FT_Err_Too_Few_Arguments => Error.TooFewArguments,
        c.FT_Err_Stack_Overflow => Error.StackOverflow,
        c.FT_Err_Code_Overflow => Error.CodeOverflow,
        c.FT_Err_Bad_Argument => Error.BadArgument,
        c.FT_Err_Divide_By_Zero => Error.DivideByZero,
        c.FT_Err_Invalid_Reference => Error.InvalidReference,
        c.FT_Err_Debug_OpCode => Error.DebugOpCode,
        c.FT_Err_ENDF_In_Exec_Stream => Error.ENDFInExecStream,
        c.FT_Err_Nested_DEFS => Error.NestedDEFS,
        c.FT_Err_Invalid_CodeRange => Error.InvalidCodeRange,
        c.FT_Err_Execution_Too_Long => Error.ExecutionTooLong,
        c.FT_Err_Too_Many_Function_Defs => Error.TooManyFunctionDefs,
        c.FT_Err_Too_Many_Instruction_Defs => Error.TooManyInstructionDefs,
        c.FT_Err_Table_Missing => Error.TableMissing,
        c.FT_Err_Horiz_Header_Missing => Error.HorizHeaderMissing,
        c.FT_Err_Locations_Missing => Error.LocationsMissing,
        c.FT_Err_Name_Table_Missing => Error.NameTableMissing,
        c.FT_Err_CMap_Table_Missing => Error.CMapTableMissing,
        c.FT_Err_Hmtx_Table_Missing => Error.HmtxTableMissing,
        c.FT_Err_Post_Table_Missing => Error.PostTableMissing,
        c.FT_Err_Invalid_Horiz_Metrics => Error.InvalidHorizMetrics,
        c.FT_Err_Invalid_CharMap_Format => Error.InvalidCharMapFormat,
        c.FT_Err_Invalid_PPem => Error.InvalidPPem,
        c.FT_Err_Invalid_Vert_Metrics => Error.InvalidVertMetrics,
        c.FT_Err_Could_Not_Find_Context => Error.CouldNotFindContext,
        c.FT_Err_Invalid_Post_Table_Format => Error.InvalidPostTableFormat,
        c.FT_Err_Invalid_Post_Table => Error.InvalidPostTable,
        c.FT_Err_Syntax_Error => Error.Syntax,
        c.FT_Err_Stack_Underflow => Error.StackUnderflow,
        c.FT_Err_Ignore => Error.Ignore,
        c.FT_Err_No_Unicode_Glyph_Name => Error.NoUnicodeGlyphName,
        c.FT_Err_Missing_Startfont_Field => Error.MissingStartfontField,
        c.FT_Err_Missing_Font_Field => Error.MissingFontField,
        c.FT_Err_Missing_Size_Field => Error.MissingSizeField,
        c.FT_Err_Missing_Fontboundingbox_Field => Error.MissingFontboundingboxField,
        c.FT_Err_Missing_Chars_Field => Error.MissingCharsField,
        c.FT_Err_Missing_Startchar_Field => Error.MissingStartcharField,
        c.FT_Err_Missing_Encoding_Field => Error.MissingEncodingField,
        c.FT_Err_Missing_Bbx_Field => Error.MissingBbxField,
        c.FT_Err_Bbx_Too_Big => Error.BbxTooBig,
        c.FT_Err_Corrupted_Font_Header => Error.CorruptedFontHeader,
        c.FT_Err_Corrupted_Font_Glyphs => Error.CorruptedFontGlyphs,
        else => unreachable,
    };
}

pub fn errorToInt(err: Error) c_int {
    return switch (err) {
        Error.CannotOpenResource => c.FT_Err_Cannot_Open_Resource,
        Error.UnknownFileFormat => c.FT_Err_Unknown_File_Format,
        Error.InvalidFileFormat => c.FT_Err_Invalid_File_Format,
        Error.InvalidVersion => c.FT_Err_Invalid_Version,
        Error.LowerModuleVersion => c.FT_Err_Lower_Module_Version,
        Error.InvalidArgument => c.FT_Err_Invalid_Argument,
        Error.UnimplementedFeature => c.FT_Err_Unimplemented_Feature,
        Error.InvalidTable => c.FT_Err_Invalid_Table,
        Error.InvalidOffset => c.FT_Err_Invalid_Offset,
        Error.ArrayTooLarge => c.FT_Err_Array_Too_Large,
        Error.MissingModule => c.FT_Err_Missing_Module,
        Error.MissingProperty => c.FT_Err_Missing_Property,
        Error.InvalidGlyphIndex => c.FT_Err_Invalid_Glyph_Index,
        Error.InvalidCharacterCode => c.FT_Err_Invalid_Character_Code,
        Error.InvalidGlyphFormat => c.FT_Err_Invalid_Glyph_Format,
        Error.CannotRenderGlyph => c.FT_Err_Cannot_Render_Glyph,
        Error.InvalidOutline => c.FT_Err_Invalid_Outline,
        Error.InvalidComposite => c.FT_Err_Invalid_Composite,
        Error.TooManyHints => c.FT_Err_Too_Many_Hints,
        Error.InvalidPixelSize => c.FT_Err_Invalid_Pixel_Size,
        Error.InvalidHandle => c.FT_Err_Invalid_Handle,
        Error.InvalidLibraryHandle => c.FT_Err_Invalid_Library_Handle,
        Error.InvalidDriverHandle => c.FT_Err_Invalid_Driver_Handle,
        Error.InvalidFaceHandle => c.FT_Err_Invalid_Face_Handle,
        Error.InvalidSizeHandle => c.FT_Err_Invalid_Size_Handle,
        Error.InvalidSlotHandle => c.FT_Err_Invalid_Slot_Handle,
        Error.InvalidCharMapHandle => c.FT_Err_Invalid_CharMap_Handle,
        Error.InvalidCacheHandle => c.FT_Err_Invalid_Cache_Handle,
        Error.InvalidStreamHandle => c.FT_Err_Invalid_Stream_Handle,
        Error.TooManyDrivers => c.FT_Err_Too_Many_Drivers,
        Error.TooManyExtensions => c.FT_Err_Too_Many_Extensions,
        Error.OutOfMemory => c.FT_Err_Out_Of_Memory,
        Error.UnlistedObject => c.FT_Err_Unlisted_Object,
        Error.CannotOpenStream => c.FT_Err_Cannot_Open_Stream,
        Error.InvalidStreamSeek => c.FT_Err_Invalid_Stream_Seek,
        Error.InvalidStreamSkip => c.FT_Err_Invalid_Stream_Skip,
        Error.InvalidStreamRead => c.FT_Err_Invalid_Stream_Read,
        Error.InvalidStreamOperation => c.FT_Err_Invalid_Stream_Operation,
        Error.InvalidFrameOperation => c.FT_Err_Invalid_Frame_Operation,
        Error.NestedFrameAccess => c.FT_Err_Nested_Frame_Access,
        Error.InvalidFrameRead => c.FT_Err_Invalid_Frame_Read,
        Error.RasterUninitialized => c.FT_Err_Raster_Uninitialized,
        Error.RasterCorrupted => c.FT_Err_Raster_Corrupted,
        Error.RasterOverflow => c.FT_Err_Raster_Overflow,
        Error.RasterNegativeHeight => c.FT_Err_Raster_Negative_Height,
        Error.TooManyCaches => c.FT_Err_Too_Many_Caches,
        Error.InvalidOpcode => c.FT_Err_Invalid_Opcode,
        Error.TooFewArguments => c.FT_Err_Too_Few_Arguments,
        Error.StackOverflow => c.FT_Err_Stack_Overflow,
        Error.CodeOverflow => c.FT_Err_Code_Overflow,
        Error.BadArgument => c.FT_Err_Bad_Argument,
        Error.DivideByZero => c.FT_Err_Divide_By_Zero,
        Error.InvalidReference => c.FT_Err_Invalid_Reference,
        Error.DebugOpCode => c.FT_Err_Debug_OpCode,
        Error.ENDFInExecStream => c.FT_Err_ENDF_In_Exec_Stream,
        Error.NestedDEFS => c.FT_Err_Nested_DEFS,
        Error.InvalidCodeRange => c.FT_Err_Invalid_CodeRange,
        Error.ExecutionTooLong => c.FT_Err_Execution_Too_Long,
        Error.TooManyFunctionDefs => c.FT_Err_Too_Many_Function_Defs,
        Error.TooManyInstructionDefs => c.FT_Err_Too_Many_Instruction_Defs,
        Error.TableMissing => c.FT_Err_Table_Missing,
        Error.HorizHeaderMissing => c.FT_Err_Horiz_Header_Missing,
        Error.LocationsMissing => c.FT_Err_Locations_Missing,
        Error.NameTableMissing => c.FT_Err_Name_Table_Missing,
        Error.CMapTableMissing => c.FT_Err_CMap_Table_Missing,
        Error.HmtxTableMissing => c.FT_Err_Hmtx_Table_Missing,
        Error.PostTableMissing => c.FT_Err_Post_Table_Missing,
        Error.InvalidHorizMetrics => c.FT_Err_Invalid_Horiz_Metrics,
        Error.InvalidCharMapFormat => c.FT_Err_Invalid_CharMap_Format,
        Error.InvalidPPem => c.FT_Err_Invalid_PPem,
        Error.InvalidVertMetrics => c.FT_Err_Invalid_Vert_Metrics,
        Error.CouldNotFindContext => c.FT_Err_Could_Not_Find_Context,
        Error.InvalidPostTableFormat => c.FT_Err_Invalid_Post_Table_Format,
        Error.InvalidPostTable => c.FT_Err_Invalid_Post_Table,
        Error.Syntax => c.FT_Err_Syntax_Error,
        Error.StackUnderflow => c.FT_Err_Stack_Underflow,
        Error.Ignore => c.FT_Err_Ignore,
        Error.NoUnicodeGlyphName => c.FT_Err_No_Unicode_Glyph_Name,
        Error.MissingStartfontField => c.FT_Err_Missing_Startfont_Field,
        Error.MissingFontField => c.FT_Err_Missing_Font_Field,
        Error.MissingSizeField => c.FT_Err_Missing_Size_Field,
        Error.MissingFontboundingboxField => c.FT_Err_Missing_Fontboundingbox_Field,
        Error.MissingCharsField => c.FT_Err_Missing_Chars_Field,
        Error.MissingStartcharField => c.FT_Err_Missing_Startchar_Field,
        Error.MissingEncodingField => c.FT_Err_Missing_Encoding_Field,
        Error.MissingBbxField => c.FT_Err_Missing_Bbx_Field,
        Error.BbxTooBig => c.FT_Err_Bbx_Too_Big,
        Error.CorruptedFontHeader => c.FT_Err_Corrupted_Font_Header,
        Error.CorruptedFontGlyphs => c.FT_Err_Corrupted_Font_Glyphs,
    };
}

pub fn mulDiv(a: i32, b: i32, _c: i32) i32 {
    return @intCast(c.FT_MulDiv(a, b, _c));
}

pub fn mulFix(a: i32, b: i32) i32 {
    return @intCast(c.FT_MulFix(a, b));
}

pub fn divFix(a: i32, b: i32) i32 {
    return @intCast(c.FT_DivFix(a, b));
}

pub fn roundFix(a: i32) i32 {
    return @intCast(c.FT_RoundFix(a));
}

pub fn ceilFix(a: i32) i32 {
    return @intCast(c.FT_CeilFix(a));
}

pub fn floorFix(a: i32) i32 {
    return @intCast(c.FT_FloorFix(a));
}

pub fn vectorTransform(vec: *Vector, matrix: Matrix) void {
    c.FT_Vector_Transform(vec, &matrix);
}

pub fn matrixMul(a: Matrix, b: *Matrix) void {
    c.FT_Matrix_Multiply(&a, b);
}

pub fn matrixInvert(m: *Matrix) Error!void {
    try intToError(c.FT_Matrix_Invert(m));
}

pub fn angleDiff(a: i32, b: i32) i32 {
    return @intCast(c.FT_Angle_Diff(a, b));
}

pub fn vectorUnit(vec: *Vector, angle: i32) void {
    c.FT_Vector_Unit(vec, angle);
}

pub fn vectorRotate(vec: *Vector, angle: i32) void {
    c.FT_Vector_Rotate(vec, angle);
}

pub fn vectorLength(vec: *Vector) i32 {
    return @intCast(c.FT_Vector_Length(vec));
}

pub fn vectorPolarize(vec: *Vector, length: *c_long, angle: *c_long) void {
    c.FT_Vector_Polarize(vec, length, angle);
}

pub fn vectorFromPolar(vec: *Vector, length: i32, angle: i32) void {
    c.FT_Vector_From_Polar(vec, length, angle);
}

pub fn getCharmapIndex(self: [*c]CharMap) ?u32 {
    const i = c.FT_Get_Charmap_Index(self);
    return if (i == -1) null else @intCast(i);
}

const std = @import("std");
const font_assets = @import("font-assets");

test "reference declarations" {
    // TODO: we cannot refAllDeclsRecursive(@This()) because of some errors in the
    // translate-c output
    std.testing.refAllDecls(@This());

    std.testing.refAllDeclsRecursive(Bitmap);
    std.testing.refAllDeclsRecursive(BitmapGlyph);
    std.testing.refAllDeclsRecursive(Affine23);
    std.testing.refAllDeclsRecursive(Face);
    std.testing.refAllDeclsRecursive(Glyph);
    std.testing.refAllDeclsRecursive(GlyphLayersIterator);
    std.testing.refAllDeclsRecursive(GlyphSlot);
    std.testing.refAllDeclsRecursive(Library);
    std.testing.refAllDeclsRecursive(OpenArgs);
    std.testing.refAllDeclsRecursive(Outline);
    std.testing.refAllDeclsRecursive(OutlineGlyph);
    std.testing.refAllDeclsRecursive(PaletteData);
    std.testing.refAllDeclsRecursive(Raster);
    std.testing.refAllDeclsRecursive(Size);
    std.testing.refAllDeclsRecursive(Stroker);
    std.testing.refAllDeclsRecursive(SvgGlyph);
}

test "create face from memory" {
    const lib = try Library.init();
    _ = try lib.createFaceMemory(font_assets.fira_sans_regular_ttf, 0);
}

test "create stroker" {
    const lib = try Library.init();
    _ = try lib.createStroker();
}

test "load glyph" {
    const lib = try Library.init();
    const face = try lib.createFaceMemory(font_assets.fira_sans_regular_ttf, 0);

    try face.setPixelSizes(100, 100);
    try face.setCharSize(10 * 10, 0, 72, 0);

    try face.loadGlyph(205, .{});
    try face.loadChar('A', .{});

    face.deinit();
}

test "charmap iterator" {
    const lib = try Library.init();
    const face = try lib.createFaceMemory(font_assets.fira_sans_regular_ttf, 0);
    var iterator = face.iterateCharmap();
    var old_char: u32 = 0;
    while (iterator.next()) |char| {
        try std.testing.expect(old_char != char);
        old_char = char;
    }
}

test "get name index" {
    const lib = try Library.init();
    const face = try lib.createFaceMemory(font_assets.fira_sans_regular_ttf, 0);
    try std.testing.expectEqual(@as(u32, 1120), face.getNameIndex("summation").?);
}

test "get index name" {
    const lib = try Library.init();
    const face = try lib.createFaceMemory(font_assets.fira_sans_regular_ttf, 0);
    var buf: [32]u8 = undefined;
    try face.getGlyphName(1120, &buf);
    try std.testing.expectEqualStrings(std.mem.sliceTo(&buf, 0), "summation");
}

test "error convertion" {
    const expectError = @import("std").testing.expectError;

    try intToError(c.FT_Err_Ok);
    try expectError(Error.OutOfMemory, intToError(c.FT_Err_Out_Of_Memory));
}
