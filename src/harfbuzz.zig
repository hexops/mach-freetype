pub const freetype = @import("freetype");
pub const c = @cImport(@cInclude("harfbuzz/hb-ft.h"));

pub const Shapers = ?[*:null]const ?[*:0]const u8;

pub const MemoryMode = enum(u2) {
    duplicate = c.HB_MEMORY_MODE_DUPLICATE,
    readonly = c.HB_MEMORY_MODE_READONLY,
    writable = c.HB_MEMORY_MODE_WRITABLE,
    readonly_may_make_writable = c.HB_MEMORY_MODE_READONLY_MAY_MAKE_WRITABLE,
};

pub const ClusterLevel = enum(u2) {
    monotone_graphemes = c.HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES,
    monotone_characters = c.HB_BUFFER_CLUSTER_LEVEL_MONOTONE_CHARACTERS,
    characters = c.HB_BUFFER_CLUSTER_LEVEL_CHARACTERS,
};

pub const ContentType = enum(u2) {
    invalid = c.HB_BUFFER_CONTENT_TYPE_INVALID,
    unicode = c.HB_BUFFER_CONTENT_TYPE_UNICODE,
    glyphs = c.HB_BUFFER_CONTENT_TYPE_GLYPHS,
};

pub const Direction = enum(u3) {
    invalid = c.HB_DIRECTION_INVALID,
    ltr = c.HB_DIRECTION_LTR,
    rtl = c.HB_DIRECTION_RTL,
    ttb = c.HB_DIRECTION_TTB,
    bit = c.HB_DIRECTION_BTT,

    pub fn fromString(str: []const u8) Direction {
        return @enumFromInt(c.hb_direction_from_string(str.ptr, @intCast(str.len)));
    }

    pub fn toString(self: Direction) [:0]const u8 {
        return std.mem.span(@as([*:0]const u8, @ptrCast(c.hb_direction_to_string(@intFromEnum(self)))));
    }
};

pub const Script = enum(u31) {
    common = c.HB_SCRIPT_COMMON,
    inherited = c.HB_SCRIPT_INHERITED,
    unknown = c.HB_SCRIPT_UNKNOWN,
    arabic = c.HB_SCRIPT_ARABIC,
    armenian = c.HB_SCRIPT_ARMENIAN,
    bengali = c.HB_SCRIPT_BENGALI,
    cyrillic = c.HB_SCRIPT_CYRILLIC,
    devanagari = c.HB_SCRIPT_DEVANAGARI,
    georgian = c.HB_SCRIPT_GEORGIAN,
    greek = c.HB_SCRIPT_GREEK,
    gujarati = c.HB_SCRIPT_GUJARATI,
    gurmukhi = c.HB_SCRIPT_GURMUKHI,
    hangul = c.HB_SCRIPT_HANGUL,
    han = c.HB_SCRIPT_HAN,
    hebrew = c.HB_SCRIPT_HEBREW,
    hiragana = c.HB_SCRIPT_HIRAGANA,
    kannada = c.HB_SCRIPT_KANNADA,
    katakana = c.HB_SCRIPT_KATAKANA,
    lao = c.HB_SCRIPT_LAO,
    latin = c.HB_SCRIPT_LATIN,
    malayalam = c.HB_SCRIPT_MALAYALAM,
    oriya = c.HB_SCRIPT_ORIYA,
    tamil = c.HB_SCRIPT_TAMIL,
    telugu = c.HB_SCRIPT_TELUGU,
    thai = c.HB_SCRIPT_THAI,
    tibetan = c.HB_SCRIPT_TIBETAN,
    bopomofo = c.HB_SCRIPT_BOPOMOFO,
    braille = c.HB_SCRIPT_BRAILLE,
    canadian_syllabics = c.HB_SCRIPT_CANADIAN_SYLLABICS,
    cherokee = c.HB_SCRIPT_CHEROKEE,
    ethiopic = c.HB_SCRIPT_ETHIOPIC,
    khmer = c.HB_SCRIPT_KHMER,
    mongolian = c.HB_SCRIPT_MONGOLIAN,
    myanmar = c.HB_SCRIPT_MYANMAR,
    ogham = c.HB_SCRIPT_OGHAM,
    runic = c.HB_SCRIPT_RUNIC,
    sinhala = c.HB_SCRIPT_SINHALA,
    syriac = c.HB_SCRIPT_SYRIAC,
    thaana = c.HB_SCRIPT_THAANA,
    yi = c.HB_SCRIPT_YI,
    deseret = c.HB_SCRIPT_DESERET,
    gothic = c.HB_SCRIPT_GOTHIC,
    old_italic = c.HB_SCRIPT_OLD_ITALIC,
    buhid = c.HB_SCRIPT_BUHID,
    hanunoo = c.HB_SCRIPT_HANUNOO,
    tagalog = c.HB_SCRIPT_TAGALOG,
    tagbanwa = c.HB_SCRIPT_TAGBANWA,
    cypriot = c.HB_SCRIPT_CYPRIOT,
    limbu = c.HB_SCRIPT_LIMBU,
    linear_b = c.HB_SCRIPT_LINEAR_B,
    osmanya = c.HB_SCRIPT_OSMANYA,
    shavian = c.HB_SCRIPT_SHAVIAN,
    tai_le = c.HB_SCRIPT_TAI_LE,
    ugaritic = c.HB_SCRIPT_UGARITIC,
    buginese = c.HB_SCRIPT_BUGINESE,
    coptic = c.HB_SCRIPT_COPTIC,
    glagolitic = c.HB_SCRIPT_GLAGOLITIC,
    kharoshthi = c.HB_SCRIPT_KHAROSHTHI,
    new_tai_lue = c.HB_SCRIPT_NEW_TAI_LUE,
    old_persian = c.HB_SCRIPT_OLD_PERSIAN,
    syloti_nagri = c.HB_SCRIPT_SYLOTI_NAGRI,
    tifinagh = c.HB_SCRIPT_TIFINAGH,
    balinese = c.HB_SCRIPT_BALINESE,
    cuneiform = c.HB_SCRIPT_CUNEIFORM,
    nko = c.HB_SCRIPT_NKO,
    phags_pa = c.HB_SCRIPT_PHAGS_PA,
    phoenician = c.HB_SCRIPT_PHOENICIAN,
    carian = c.HB_SCRIPT_CARIAN,
    cham = c.HB_SCRIPT_CHAM,
    kayah_li = c.HB_SCRIPT_KAYAH_LI,
    lepcha = c.HB_SCRIPT_LEPCHA,
    lycian = c.HB_SCRIPT_LYCIAN,
    lydian = c.HB_SCRIPT_LYDIAN,
    ol_chiki = c.HB_SCRIPT_OL_CHIKI,
    rejang = c.HB_SCRIPT_REJANG,
    saurashtra = c.HB_SCRIPT_SAURASHTRA,
    sundanese = c.HB_SCRIPT_SUNDANESE,
    vai = c.HB_SCRIPT_VAI,
    avestan = c.HB_SCRIPT_AVESTAN,
    bamum = c.HB_SCRIPT_BAMUM,
    egyptian_hieroglyphs = c.HB_SCRIPT_EGYPTIAN_HIEROGLYPHS,
    imperial_aramaic = c.HB_SCRIPT_IMPERIAL_ARAMAIC,
    inscriptional_pahlavi = c.HB_SCRIPT_INSCRIPTIONAL_PAHLAVI,
    inscriptional_parthian = c.HB_SCRIPT_INSCRIPTIONAL_PARTHIAN,
    javanese = c.HB_SCRIPT_JAVANESE,
    kaithi = c.HB_SCRIPT_KAITHI,
    lisu = c.HB_SCRIPT_LISU,
    meetei_mayek = c.HB_SCRIPT_MEETEI_MAYEK,
    old_south_arabian = c.HB_SCRIPT_OLD_SOUTH_ARABIAN,
    old_turkic = c.HB_SCRIPT_OLD_TURKIC,
    samaritan = c.HB_SCRIPT_SAMARITAN,
    tai_tham = c.HB_SCRIPT_TAI_THAM,
    tai_viet = c.HB_SCRIPT_TAI_VIET,
    batak = c.HB_SCRIPT_BATAK,
    brahmi = c.HB_SCRIPT_BRAHMI,
    mandaic = c.HB_SCRIPT_MANDAIC,
    chakma = c.HB_SCRIPT_CHAKMA,
    meroitic_cursive = c.HB_SCRIPT_MEROITIC_CURSIVE,
    meroitic_hieroglyphs = c.HB_SCRIPT_MEROITIC_HIEROGLYPHS,
    miao = c.HB_SCRIPT_MIAO,
    sharada = c.HB_SCRIPT_SHARADA,
    sora_sompeng = c.HB_SCRIPT_SORA_SOMPENG,
    takri = c.HB_SCRIPT_TAKRI,
    bassa_vah = c.HB_SCRIPT_BASSA_VAH,
    caucasian_albanian = c.HB_SCRIPT_CAUCASIAN_ALBANIAN,
    duployan = c.HB_SCRIPT_DUPLOYAN,
    elbasan = c.HB_SCRIPT_ELBASAN,
    grantha = c.HB_SCRIPT_GRANTHA,
    khojki = c.HB_SCRIPT_KHOJKI,
    khudawadi = c.HB_SCRIPT_KHUDAWADI,
    linear_a = c.HB_SCRIPT_LINEAR_A,
    mahajani = c.HB_SCRIPT_MAHAJANI,
    manichaean = c.HB_SCRIPT_MANICHAEAN,
    mende_kikakui = c.HB_SCRIPT_MENDE_KIKAKUI,
    modi = c.HB_SCRIPT_MODI,
    mro = c.HB_SCRIPT_MRO,
    nabataean = c.HB_SCRIPT_NABATAEAN,
    old_north_arabian = c.HB_SCRIPT_OLD_NORTH_ARABIAN,
    old_permic = c.HB_SCRIPT_OLD_PERMIC,
    pahawh_hmong = c.HB_SCRIPT_PAHAWH_HMONG,
    palmyrene = c.HB_SCRIPT_PALMYRENE,
    pau_cin_hau = c.HB_SCRIPT_PAU_CIN_HAU,
    psalter_pahlavi = c.HB_SCRIPT_PSALTER_PAHLAVI,
    siddham = c.HB_SCRIPT_SIDDHAM,
    tirhuta = c.HB_SCRIPT_TIRHUTA,
    warang_citi = c.HB_SCRIPT_WARANG_CITI,
    ahom = c.HB_SCRIPT_AHOM,
    anatolian_hieroglyphs = c.HB_SCRIPT_ANATOLIAN_HIEROGLYPHS,
    hatran = c.HB_SCRIPT_HATRAN,
    multani = c.HB_SCRIPT_MULTANI,
    old_hungarian = c.HB_SCRIPT_OLD_HUNGARIAN,
    signwriting = c.HB_SCRIPT_SIGNWRITING,
    adlam = c.HB_SCRIPT_ADLAM,
    bhaiksuki = c.HB_SCRIPT_BHAIKSUKI,
    marchen = c.HB_SCRIPT_MARCHEN,
    osage = c.HB_SCRIPT_OSAGE,
    tangut = c.HB_SCRIPT_TANGUT,
    newa = c.HB_SCRIPT_NEWA,
    masaram_gondi = c.HB_SCRIPT_MASARAM_GONDI,
    nushu = c.HB_SCRIPT_NUSHU,
    soyombo = c.HB_SCRIPT_SOYOMBO,
    zanabazar_square = c.HB_SCRIPT_ZANABAZAR_SQUARE,
    dogra = c.HB_SCRIPT_DOGRA,
    gunjala_gondi = c.HB_SCRIPT_GUNJALA_GONDI,
    hanifi_rohingya = c.HB_SCRIPT_HANIFI_ROHINGYA,
    makasar = c.HB_SCRIPT_MAKASAR,
    medefaidrin = c.HB_SCRIPT_MEDEFAIDRIN,
    old_sogdian = c.HB_SCRIPT_OLD_SOGDIAN,
    sogdian = c.HB_SCRIPT_SOGDIAN,
    elymaic = c.HB_SCRIPT_ELYMAIC,
    nandinagari = c.HB_SCRIPT_NANDINAGARI,
    nyiakeng_puachue_hmong = c.HB_SCRIPT_NYIAKENG_PUACHUE_HMONG,
    wancho = c.HB_SCRIPT_WANCHO,
    chorasmian = c.HB_SCRIPT_CHORASMIAN,
    dives_akuru = c.HB_SCRIPT_DIVES_AKURU,
    khitan_small_script = c.HB_SCRIPT_KHITAN_SMALL_SCRIPT,
    yezidi = c.HB_SCRIPT_YEZIDI,
    cypro_minoan = c.HB_SCRIPT_CYPRO_MINOAN,
    old_uyghur = c.HB_SCRIPT_OLD_UYGHUR,
    tangsa = c.HB_SCRIPT_TANGSA,
    toto = c.HB_SCRIPT_TOTO,
    vithkuqi = c.HB_SCRIPT_VITHKUQI,
    math = c.HB_SCRIPT_MATH,
    kawi = c.HB_SCRIPT_KAWI,
    nag_mundari = c.HB_SCRIPT_NAG_MUNDARI,
    invalid = c.HB_SCRIPT_INVALID,

    pub fn fromISO15924Tag(tag: Tag) Script {
        return @enumFromInt(c.hb_script_from_iso15924_tag(tag.handle));
    }

    pub fn fromString(str: []const u8) Script {
        return @enumFromInt(c.hb_script_from_string(str.ptr, @intCast(str.len)));
    }

    pub fn toISO15924Tag(self: Script) Tag {
        return .{ .handle = c.hb_script_to_iso15924_tag(@intFromEnum(self)) };
    }

    pub fn getHorizontalDirection(self: Script) Direction {
        return @enumFromInt(c.hb_script_get_horizontal_direction(@intFromEnum(self)));
    }
};

pub const SerializeFormat = enum(u31) {
    text = c.HB_BUFFER_SERIALIZE_FORMAT_TEXT,
    json = c.HB_BUFFER_SERIALIZE_FORMAT_JSON,
    invalid = c.HB_BUFFER_SERIALIZE_FORMAT_INVALID,
};

pub const DiffFlags = packed struct(c_int) {
    content_type_mismatch: bool = false,
    length_mismatch: bool = false,
    notdef_present: bool = false,
    dotted_circle_present: bool = false,
    codepoint_mismatch: bool = false,
    cluster_mismatch: bool = false,
    glyph_flags_mismatch: bool = false,
    position_mismatch: bool = false,
    _padding: u24 = 0,
};

pub const GlyphFlags = packed struct(c_int) {
    unsafe_to_break: bool = false,
    unsafe_to_concat: bool = false,
    safe_to_insert_tatweel: bool = false,
    _padding: u29 = 0,
};

pub const SerializeFlags = packed struct(c_int) {
    no_clusters: bool = false,
    no_positions: bool = false,
    no_glyph_names: bool = false,
    glyph_extents: bool = false,
    glyph_flags: bool = false,
    no_advances: bool = false,
    _padding: u26 = 0,
};

pub const GlyphInfo = extern struct {
    codepoint: u32,
    mask: u32,
    cluster: u32,
    var1: u32,
    var2: u32,

    pub fn getFlags(self: GlyphInfo) GlyphFlags {
        return @bitCast(c.hb_glyph_info_get_glyph_flags(@ptrCast(&self)));
    }
};

pub const GlyphPosition = extern struct {
    x_advance: i32,
    y_advance: i32,
    x_offset: i32,
    y_offset: i32,

    /// Private / internal field.
    @"var": i32,
};

pub const Blob = struct {
    handle: *c.hb_blob_t,

    pub fn init(data: []u8, mode: MemoryMode) ?Blob {
        return Blob{
            .handle = c.hb_blob_create_or_fail(&data[0], @intCast(data.len), @intFromEnum(mode), null, null) orelse return null,
        };
    }

    pub fn initOrEmpty(data: []u8, mode: MemoryMode) Blob {
        return .{
            .handle = c.hb_blob_create(&data[0], @intCast(data.len), @intFromEnum(mode), null, null).?,
        };
    }

    pub fn initFromFile(path: [*:0]const u8) ?Blob {
        return Blob{
            .handle = c.hb_blob_create_from_file_or_fail(path) orelse return null,
        };
    }

    pub fn initFromFileOrEmpty(path: [*:0]const u8) Blob {
        return .{
            .handle = c.hb_blob_create_from_file(path).?,
        };
    }

    pub fn initEmpty() Blob {
        return .{ .handle = c.hb_blob_get_empty().? };
    }

    pub fn createSubBlobOrEmpty(self: Blob, offset: u32, len: u32) Blob {
        return .{
            .handle = c.hb_blob_create_sub_blob(self.handle, offset, len).?,
        };
    }

    pub fn copyWritable(self: Blob) ?Blob {
        return Blob{
            .handle = c.hb_blob_copy_writable_or_fail(self.handle) orelse return null,
        };
    }

    pub fn deinit(self: Blob) void {
        c.hb_blob_destroy(self.handle);
    }

    pub fn getData(self: Blob, len: ?u32) []const u8 {
        var l = len;
        const data = c.hb_blob_get_data(self.handle, if (l) |_| &l.? else null);
        return if (l) |_|
            data[0..l.?]
        else
            std.mem.sliceTo(data, 0);
    }

    pub fn getDataWritable(self: Blob, len: ?u32) ?[]const u8 {
        var l = len;
        const data = c.hb_blob_get_data(self.handle, if (l) |_| &l.? else null);
        return if (data == null)
            null
        else if (l) |_|
            data[0..l.?]
        else
            std.mem.sliceTo(data, 0);
    }

    pub fn getLength(self: Blob) u32 {
        return c.hb_blob_get_length(self.handle);
    }

    pub fn isImmutable(self: Blob) bool {
        return c.hb_blob_is_immutable(self.handle) > 0;
    }

    pub fn makeImmutable(self: Blob) void {
        c.hb_blob_make_immutable(self.handle);
    }

    pub fn reference(self: Blob) Blob {
        return .{
            .handle = c.hb_blob_reference(self.handle).?,
        };
    }
};

pub const Buffer = struct {
    pub const Flags = packed struct(c_int) {
        bot: bool = false,
        eot: bool = false,
        preserve_default_ignorables: bool = false,
        remove_default_ignorables: bool = false,
        do_not_insert_dotted_circle: bool = false,
        verify: bool = false,
        produce_unsafe_to_concat: bool = false,
        produce_safe_to_insert_tatweel: bool = false,
        _padding: u24 = 0,
    };

    handle: *c.hb_buffer_t,

    pub fn init() ?Buffer {
        const b = c.hb_buffer_create();
        if (c.hb_buffer_allocation_successful(b) < 1)
            return null;
        return Buffer{ .handle = b.? };
    }

    pub fn initEmpty() Buffer {
        return .{ .handle = c.hb_buffer_get_empty().? };
    }

    pub fn initSimilar(self: Buffer) ?Buffer {
        const b = c.hb_buffer_create_similar(self.handle);
        if (c.hb_buffer_allocation_successful(b) < 1)
            return null;
        return Buffer{ .handle = b.? };
    }

    pub fn reference(self: Buffer) Buffer {
        return .{
            .handle = c.hb_buffer_reference(self.handle).?,
        };
    }

    pub fn deinit(self: Buffer) void {
        c.hb_buffer_destroy(self.handle);
    }

    pub fn reset(self: Buffer) void {
        c.hb_buffer_reset(self.handle);
    }

    pub fn clearContents(self: Buffer) void {
        c.hb_buffer_clear_contents(self.handle);
    }

    pub fn preAllocate(self: Buffer, size: u32) error{OutOfMemory}!void {
        if (c.hb_buffer_pre_allocate(self.handle, size) < 1)
            return error.OutOfMemory;
    }

    pub fn allocationSuccessful(self: Buffer) bool {
        return c.hb_buffer_allocation_successful(self.handle) > 0;
    }

    pub fn add(self: Buffer, codepoint: u32, cluster: u32) void {
        c.hb_buffer_add(self.handle, codepoint, cluster);
    }

    pub fn addCodepoints(self: Buffer, text: []const u32, item_offset: u32, item_length: ?u31) void {
        c.hb_buffer_add_codepoints(self.handle, &text[0], @intCast(text.len), item_offset, if (item_length) |l| l else @intCast(text.len));
    }

    pub fn addUTF32(self: Buffer, text: []const u32, item_offset: u32, item_length: ?u31) void {
        c.hb_buffer_add_utf32(self.handle, &text[0], @intCast(text.len), item_offset, if (item_length) |l| l else @intCast(text.len));
    }

    pub fn addUTF16(self: Buffer, text: []const u16, item_offset: u32, item_length: ?u31) void {
        c.hb_buffer_add_utf16(self.handle, &text[0], @intCast(text.len), item_offset, if (item_length) |l| l else @intCast(text.len));
    }

    pub fn addUTF8(self: Buffer, text: []const u8, item_offset: u32, item_length: ?u31) void {
        c.hb_buffer_add_utf8(self.handle, &text[0], @intCast(text.len), item_offset, if (item_length) |l| l else @intCast(text.len));
    }

    pub fn addLatin1(self: Buffer, text: []const u8, item_offset: u32, item_length: ?u31) void {
        c.hb_buffer_add_latin1(self.handle, &text[0], @intCast(text.len), item_offset, if (item_length) |l| l else @intCast(text.len));
    }

    pub fn append(self: Buffer, source: Buffer, start: u32, end: u32) void {
        c.hb_buffer_append(self.handle, source.handle, start, end);
    }

    pub fn getContentType(self: Buffer) ContentType {
        return @enumFromInt(c.hb_buffer_get_content_type(self.handle));
    }

    pub fn setContentType(self: Buffer, content_type: ContentType) void {
        c.hb_buffer_set_content_type(self.handle, @intFromEnum(content_type));
    }

    pub fn getDirection(self: Buffer) Direction {
        return @enumFromInt(c.hb_buffer_get_direction(self.handle));
    }

    pub fn setDirection(self: Buffer, direction: Direction) void {
        c.hb_buffer_set_direction(self.handle, @intFromEnum(direction));
    }

    pub fn getScript(self: Buffer) Script {
        return @enumFromInt(c.hb_buffer_get_script(self.handle));
    }

    pub fn setScript(self: Buffer, script: Script) void {
        c.hb_buffer_set_script(self.handle, @intFromEnum(script));
    }

    pub fn getLanguage(self: Buffer) Language {
        return Language{ .handle = c.hb_buffer_get_language(self.handle) };
    }

    pub fn setLanguage(self: Buffer, lang: Language) void {
        c.hb_buffer_set_language(self.handle, lang.handle);
    }

    pub fn getFlags(self: Buffer) Flags {
        return @bitCast(c.hb_buffer_get_flags(self.handle));
    }

    pub fn setFlags(self: Buffer, flags: Flags) void {
        c.hb_buffer_set_flags(self.handle, @bitCast(flags));
    }

    pub fn getClusterLevel(self: Buffer) ClusterLevel {
        return @enumFromInt(c.hb_buffer_get_cluster_level(self.handle));
    }

    pub fn setClusterLevel(self: Buffer, level: ClusterLevel) void {
        c.hb_buffer_set_cluster_level(self.handle, @intFromEnum(level));
    }

    pub fn getLength(self: Buffer) u32 {
        return c.hb_buffer_get_length(self.handle);
    }

    pub fn setLength(self: Buffer, new_len: u32) error{OutOfMemory}!void {
        if (c.hb_buffer_set_length(self.handle, new_len) < 1)
            return error.OutOfMemory;
    }

    pub fn getSegmentProps(self: Buffer) SegmentProps {
        var props: c.hb_segment_properties_t = undefined;
        c.hb_buffer_get_segment_properties(self.handle, &props);
        return SegmentProps.from(props);
    }

    pub fn setSegmentProps(self: Buffer, props: SegmentProps) void {
        c.hb_buffer_set_segment_properties(self.handle, &props.cast());
    }

    pub fn guessSegmentProps(self: Buffer) void {
        c.hb_buffer_guess_segment_properties(self.handle);
    }

    pub fn getGlyphInfos(self: Buffer) []GlyphInfo {
        var length: u32 = 0;
        return @ptrCast(c.hb_buffer_get_glyph_infos(@ptrCast(self.handle), &length)[0..length]);
    }

    pub fn getGlyphPositions(self: Buffer) ?[]GlyphPosition {
        var length: u32 = 0;
        return if (c.hb_buffer_get_glyph_positions(@ptrCast(self.handle), &length)) |positions|
            @as([*]GlyphPosition, @ptrCast(positions))[0..length]
        else
            null;
    }

    pub fn hasPositions(self: Buffer) bool {
        return c.hb_buffer_has_positions(self.handle) > 0;
    }

    pub fn getInvisibleGlyph(self: Buffer) u32 {
        return c.hb_buffer_get_invisible_glyph(self.handle);
    }

    pub fn setInvisibleGlyph(self: Buffer, codepoint: u32) void {
        c.hb_buffer_set_invisible_glyph(self.handle, codepoint);
    }

    pub fn getGlyphNotFound(self: Buffer) u32 {
        return c.hb_buffer_get_not_found_glyph(self.handle);
    }

    pub fn setGlyphNotFound(self: Buffer, codepoint: u32) void {
        c.hb_buffer_set_not_found_glyph(self.handle, codepoint);
    }

    pub fn getReplacementCodepoint(self: Buffer) u32 {
        return c.hb_buffer_get_replacement_codepoint(self.handle);
    }

    pub fn setReplacementCodepoint(self: Buffer, codepoint: u32) void {
        c.hb_buffer_set_replacement_codepoint(self.handle, codepoint);
    }

    pub fn normalizeGlyphs(self: Buffer) void {
        c.hb_buffer_normalize_glyphs(self.handle);
    }

    pub fn reverse(self: Buffer) void {
        c.hb_buffer_reverse(self.handle);
    }

    pub fn reverseRange(self: Buffer, start: u32, end: u32) void {
        c.hb_buffer_reverse_range(self.handle, start, end);
    }

    pub fn reverseClusters(self: Buffer) void {
        c.hb_buffer_reverse_clusters(self.handle);
    }

    pub fn diff(self: Buffer, ref: Buffer, dottedcircle_glyph: u32, position_fuzz: u32) DiffFlags {
        return @bitCast(c.hb_buffer_diff(self.handle, ref.handle, dottedcircle_glyph, position_fuzz));
    }
};

pub const Face = struct {
    handle: *c.hb_face_t,

    pub fn init(blob: Blob, index: u16) Face {
        return .{ .handle = c.hb_face_create(blob.handle, index).? };
    }

    pub fn fromFreetypeFace(face: freetype.Face) Face {
        return .{ .handle = c.hb_ft_face_create_referenced(@ptrCast(face.handle)).? };
    }

    pub fn initEmpty() Face {
        return .{ .handle = c.hb_face_get_empty().? };
    }

    pub fn getCount(blob: Blob) u32 {
        return c.hb_face_count(blob.handle);
    }

    pub fn deinit(self: Face) void {
        c.hb_face_destroy(self.handle);
    }

    pub fn getGlyphCount(self: Face) u32 {
        return c.hb_face_get_glyph_count(self.handle);
    }

    pub fn setGlyphCount(self: Face, count: u32) void {
        return c.hb_face_set_glyph_count(self.handle, count);
    }

    pub fn getUnitsPerEM(self: Face) u32 {
        return c.hb_face_get_upem(self.handle);
    }

    pub fn setUnitsPerEM(self: Face, upem: u32) void {
        return c.hb_face_set_upem(self.handle, upem);
    }

    pub fn setIndex(self: Face, index: u32) void {
        return c.hb_face_set_index(self.handle, index);
    }

    pub fn isImmutable(self: Face) bool {
        return c.hb_face_is_immutable(self.handle) > 0;
    }

    pub fn makeImmutable(self: Face) void {
        c.hb_face_make_immutable(self.handle);
    }

    pub fn reference(self: Face) Face {
        return .{
            .handle = c.hb_face_reference(self.handle).?,
        };
    }

    pub fn collectUnicodes(self: Face) UnicodeIterator {
        const set: *c.hb_set_t = undefined;
        c.hb_face_collect_unicodes(self.handle, set);
        return .{ .set = set };
    }
};

pub const Feature = extern struct {
    tag: c.hb_tag_t,
    value: u32,
    start: c_uint,
    end: c_uint,

    pub fn fromString(str: []const u8) ?Feature {
        var f: Feature = undefined;
        return if (c.hb_feature_from_string(str.ptr, @intCast(str.len), @ptrCast(&f)) > 1)
            f
        else
            null;
    }

    pub fn toString(self: *Feature, buf: []u8) void {
        c.hb_feature_to_string(@ptrCast(self), buf.ptr, @intCast(buf.len));
    }
};

pub const Font = struct {
    handle: *c.hb_font_t,

    // Font-wide extent values, measured in font units.
    //
    // .ascender: The height of typographic ascenders.
    // .descender: The depth of typographic descenders.
    // .line_gap: The suggested line-spacing gap.
    //
    // Note that typically .ascender is positive and .descender negative, in coordinate systems that
    // grow up.
    pub const Extents = c.hb_font_extents_t;

    pub fn init(face: Face) Font {
        return .{ .handle = c.hb_font_create(face.handle).? };
    }

    pub fn fromFreetypeFace(face: freetype.Face) Font {
        return .{ .handle = c.hb_ft_font_create_referenced(@ptrCast(face.handle)).? };
    }

    pub fn createSubFont(self: Font) Font {
        return .{
            .handle = c.hb_font_create_sub_font(self.handle).?,
        };
    }

    pub fn deinit(self: Font) void {
        c.hb_font_destroy(self.handle);
    }

    pub fn freetypeFaceChanged(self: Font) void {
        c.hb_ft_font_changed(self.handle);
    }

    pub fn setFreetypeLoadFlags(self: Font, flags: freetype.LoadFlags) void {
        c.hb_ft_font_set_load_flags(self.handle, @bitCast(flags));
    }

    pub fn getFace(self: Font) Face {
        return .{ .handle = c.hb_font_get_face(self.handle).? };
    }

    pub fn getFreetypeFace(self: Font) freetype.Face {
        return .{ .handle = @ptrCast(c.hb_ft_font_get_face(@ptrCast(self.handle))) };
    }

    pub fn getGlyph(self: Font, unicode: u32, variation_selector: u32) ?u32 {
        var g: u32 = 0;
        return if (c.hb_font_get_glyph(self.handle, unicode, variation_selector, &g) > 0)
            g
        else
            null;
    }

    pub fn getParent(self: Font) ?Font {
        return Font{ .handle = c.hb_font_get_parent(self.handle) orelse return null };
    }

    pub fn setFace(self: Font, face: Face) void {
        return c.hb_font_set_face(self.handle, face.handle);
    }

    pub fn Funcs(
        comptime Context: type,
        comptime FontData: type,
    ) type {
        return struct {
            handle: *c.hb_font_funcs_t,

            const F = @This();

            pub fn init(
                comptime general: struct {
                    get_nominal_glyph: ?fn (
                        font: Font,
                        font_data: *FontData,
                        unicode: u21,
                        out_glyph: *u32,
                        ctx: *Context,
                    ) bool,
                    get_nominal_glyphs: ?fn (
                        font: Font,
                        font_data: *FontData,
                        count: u32,
                        first_unicode: [*]const u32,
                        unicode_stride: u32,
                        first_glyph: [*]const u32,
                        glyph_stride: u32,
                        ctx: *Context,
                    ) u32,
                    get_variation_glyph: ?fn (
                        font: Font,
                        font_data: *FontData,
                        unicode: u21,
                        variation_selector: u21,
                        out_glyph: *u32,
                        ctx: *Context,
                    ) bool,
                    get_font_h_extents: ?fn (
                        font: Font,
                        font_data: *FontData,
                        out_metrics: *Font.Extents,
                        ctx: *Context,
                    ) bool,
                    get_glyph_h_advances: ?fn (
                        font: Font,
                        font_data: *FontData,
                        count: u32,
                        first_glyph: [*]const u32,
                        glyph_stride: u32,
                        out_first_advance: [*]i32,
                        advance_stride: u32,
                        ctx: *Context,
                    ) void,
                },
            ) ?F {
                const handle = c.hb_font_funcs_create() orelse return null;

                const HB_NO_VERTICAL = false;
                _ = HB_NO_VERTICAL;
                const HB_NO_OT_SHAPE_FALLBACK = false;
                _ = HB_NO_OT_SHAPE_FALLBACK;
                const HB_NO_DRAW = false;
                _ = HB_NO_DRAW;
                const HB_NO_PAINT = false;
                _ = HB_NO_PAINT;

                if (general.get_nominal_glyph) |callback| c.hb_font_funcs_set_nominal_glyph_func(handle, (struct {
                    pub fn cCallback(
                        font: ?*c.hb_font_t,
                        font_data: ?*anyopaque,
                        unicode: c.hb_codepoint_t,
                        out_glyph: [*c]c.hb_codepoint_t,
                        user_data: ?*anyopaque,
                    ) callconv(.C) c.hb_bool_t {
                        return if (callback(
                            Font{ .handle = font.? },
                            @ptrCast(font_data),
                            @intCast(unicode),
                            @ptrCast(out_glyph),
                            @ptrCast(user_data.?),
                        )) 1 else 0;
                    }
                }).cCallback, null, null);

                if (general.get_nominal_glyphs) |callback| c.hb_font_funcs_set_nominal_glyphs_func(handle, (struct {
                    pub fn cCallback(
                        font: ?*c.hb_font_t,
                        font_data: ?*anyopaque,
                        count: c_uint,
                        first_unicode: [*c]const c.hb_codepoint_t,
                        unicode_stride: u32,
                        first_glyph: [*c]const c.hb_codepoint_t,
                        glyph_stride: u32,
                        user_data: ?*anyopaque,
                    ) callconv(.C) c_uint {
                        return callback(
                            Font{ .handle = font.? },
                            @ptrCast(font_data),
                            count,
                            first_unicode,
                            unicode_stride,
                            first_glyph,
                            glyph_stride,
                            @ptrCast(user_data.?),
                        );
                    }
                }).cCallback, null, null);

                if (general.get_variation_glyph) |callback| c.hb_font_funcs_set_variation_glyph_func(handle, (struct {
                    pub fn cCallback(
                        font: ?*c.hb_font_t,
                        font_data: ?*anyopaque,
                        unicode: c.hb_codepoint_t,
                        variation_selector: c.hb_codepoint_t,
                        out_glyph: [*c]c.hb_codepoint_t,
                        user_data: ?*anyopaque,
                    ) callconv(.C) c.hb_bool_t {
                        return if (callback(
                            Font{ .handle = font.? },
                            @ptrCast(font_data),
                            @intCast(unicode),
                            @intCast(variation_selector),
                            @ptrCast(out_glyph),
                            @ptrCast(user_data.?),
                        )) 1 else 0;
                    }
                }).cCallback, null, null);

                if (general.get_font_h_extents) |callback| c.hb_font_funcs_set_font_h_extents_func(handle, (struct {
                    pub fn cCallback(
                        font: ?*c.hb_font_t,
                        font_data: ?*anyopaque,
                        out_metrics: [*c]Font.Extents,
                        user_data: ?*anyopaque,
                    ) callconv(.C) c.hb_bool_t {
                        return if (callback(
                            Font{ .handle = font.? },
                            @ptrCast(font_data),
                            @ptrCast(out_metrics),
                            @ptrCast(user_data.?),
                        )) 1 else 0;
                    }
                }).cCallback, null, null);

                if (general.get_glyph_h_advances) |callback| c.hb_font_funcs_set_glyph_h_advances_func(handle, (struct {
                    pub fn cCallback(
                        font: ?*c.hb_font_t,
                        font_data: ?*anyopaque,
                        count: c_uint,
                        first_glyph: [*c]const c.hb_codepoint_t,
                        glyph_stride: u32,
                        out_first_advance: [*c]i32,
                        advance_stride: u32,
                        user_data: ?*anyopaque,
                    ) callconv(.C) void {
                        return callback(
                            Font{ .handle = font.? },
                            @ptrCast(font_data),
                            count,
                            first_glyph,
                            glyph_stride,
                            out_first_advance,
                            advance_stride,
                            @ptrCast(user_data.?),
                        );
                    }
                }).cCallback, null, null);

                // #ifndef HB_NO_VERTICAL
                //     //hb_font_funcs_set_font_v_extents_func (funcs, hb_ft_get_font_v_extents, nullptr, nullptr);
                //     hb_font_funcs_set_glyph_v_advance_func (funcs, hb_ft_get_glyph_v_advance, nullptr, nullptr);
                //     hb_font_funcs_set_glyph_v_origin_func (funcs, hb_ft_get_glyph_v_origin, nullptr, nullptr);
                // #endif

                // #ifndef HB_NO_OT_SHAPE_FALLBACK
                //     hb_font_funcs_set_glyph_h_kerning_func (funcs, hb_ft_get_glyph_h_kerning, nullptr, nullptr);
                // #endif
                //     hb_font_funcs_set_glyph_extents_func (funcs, hb_ft_get_glyph_extents, nullptr, nullptr);
                //     hb_font_funcs_set_glyph_contour_point_func (funcs, hb_ft_get_glyph_contour_point, nullptr, nullptr);
                //     hb_font_funcs_set_glyph_name_func (funcs, hb_ft_get_glyph_name, nullptr, nullptr);
                //     hb_font_funcs_set_glyph_from_name_func (funcs, hb_ft_get_glyph_from_name, nullptr, nullptr);

                // #ifndef HB_NO_DRAW
                //     hb_font_funcs_set_draw_glyph_func (funcs, hb_ft_draw_glyph, nullptr, nullptr);
                // #endif

                // #ifndef HB_NO_PAINT
                // #if (FREETYPE_MAJOR*10000 + FREETYPE_MINOR*100 + FREETYPE_PATCH) >= 21300
                //     hb_font_funcs_set_paint_glyph_func (funcs, hb_ft_paint_glyph, nullptr, nullptr);
                // #endif
                // #endif

                c.hb_font_funcs_make_immutable(handle);

                return F{
                    .handle = handle,
                };
            }

            pub fn reference(f: F) F {
                return .{
                    .handle = c.hb_font_funcs_reference(f.handle).?,
                };
            }

            pub fn deinit(f: F) void {
                c.hb_font_funcs_destroy(f.handle);
            }
        };
    }

    // funcs type: Funcs(Context, FontData)
    pub fn setFuncs(
        self: Font,
        comptime Context: type,
        comptime FontData: type,
        ctx: *Context,
        funcs: Funcs(Context, FontData),
        destroy: fn (font_data: *FontData) void,
    ) void {
        return c.hb_font_set_funcs(
            self.handle,
            funcs.handle,
            ctx,
            (struct {
                pub fn cCallback(font_data: ?*anyopaque) callconv(.C) void {
                    destroy(@ptrCast(font_data));
                }
            }).cCallback,
        );
    }

    pub fn setScale(self: Font, x_scale: i32, y_scale: i32) void {
        c.hb_font_set_scale(self.handle, x_scale, y_scale);
    }

    pub fn getScale(self: Font) @Vector(2, i32) {
        var x: c_int = 0;
        var y: c_int = 0;
        c.hb_font_get_scale(self.handle, &x, &y);
        return .{ @intCast(x), @intCast(y) };
    }

    // A zero value means "no hinting in that direction"
    pub fn setPPEM(self: Font, x: u32, y: u32) void {
        c.hb_font_set_ppem(self.handle, x, y);
    }

    pub fn getPPEM(self: Font) @Vector(2, u32) {
        var x: c_uint = 0;
        var y: c_uint = 0;
        c.hb_font_get_ppem(self.handle, &x, &y);
        return .{ @intCast(x), @intCast(y) };
    }

    // Point size per EM.  Used for optical-sizing in CoreText
    // A value of zero means "not set".
    pub fn setPTEM(self: Font, ptem: f32) void {
        c.hb_font_set_ptem(self.handle, ptem);
    }

    pub fn getPTEM(self: Font) f32 {
        return c.hb_font_get_ptem(self.handle);
    }

    const SyntheticBold = struct {
        x_embolden: f32,
        y_embolden: f32,
        in_place: bool,
    };

    pub fn setSyntheticBold(self: Font, v: SyntheticBold) void {
        c.hb_font_set_synthetic_bold(self.handle, v.x_embolden, v.y_embolden, v.in_place);
    }

    pub fn getSyntheticBold(self: Font) SyntheticBold {
        var v: SyntheticBold = undefined;
        var in_place: c.hb_bool_t = undefined;
        c.hb_font_get_synthetic_bold(self.handle, &v.x_embolden, &v.y_embolden, &in_place);
        v.in_place = in_place > 0;
        return v;
    }

    pub fn setSyntheticSlant(self: Font, slant: f32) void {
        c.hb_font_set_synthetic_slant(self.handle, slant);
    }

    pub fn getSyntheticSlant(self: Font) f32 {
        return c.hb_font_get_synthetic_slant(self.handle);
    }

    pub fn shape(self: Font, buf: Buffer, features: ?[]const Feature) void {
        c.hb_shape(
            @ptrCast(self.handle),
            buf.handle,
            if (features) |f| @ptrCast(f.ptr) else null,
            if (features) |f| @intCast(f.len) else 0,
        );
    }

    pub fn shapeFull(self: Font, buf: Buffer, features: ?[]const Feature, shapers: Shapers) error{ShapingFailed}!void {
        if (c.hb_shape_full(
            @ptrCast(self.handle),
            buf.handle,
            if (features) |f| @ptrCast(f.ptr) else null,
            if (features) |f| @intCast(f.len) else 0,
            shapers,
        ) < 1) return error.ShapingFailed;
    }
};

pub const Language = struct {
    handle: c.hb_language_t,

    pub fn matches(self: Language, other: Language) bool {
        return c.hb_language_matches(self.handle, other.handle) > 0;
    }

    pub fn fromString(name: []const u8) Language {
        return .{
            .handle = c.hb_language_from_string(name.ptr, @intCast(name.len)),
        };
    }

    pub fn toString(self: Language) [:0]const u8 {
        return std.mem.span(@as([*:0]const u8, @ptrCast(c.hb_language_to_string(self.handle))));
    }

    pub fn getDefault() Language {
        return .{ .handle = c.hb_language_get_default() };
    }
};

pub const ListShapers = struct {
    index: usize,
    list: [*:null]const ?[*:0]const u8,

    pub fn init() ListShapers {
        return .{ .index = 0, .list = c.hb_shape_list_shapers() };
    }

    pub fn next(self: *ListShapers) ?[:0]const u8 {
        self.index += 1;
        return std.mem.span(
            self.list[self.index - 1] orelse return null,
        );
    }
};

pub const SegmentProps = struct {
    direction: Direction,
    script: Script,
    language: Language,

    pub fn from(c_struct: c.hb_segment_properties_t) SegmentProps {
        return .{
            .direction = @enumFromInt(c_struct.direction),
            .script = @enumFromInt(c_struct.script),
            .language = Language{ .handle = c_struct.language },
        };
    }

    pub fn cast(self: SegmentProps) c.hb_segment_properties_t {
        return .{
            .reserved1 = undefined,
            .reserved2 = undefined,
            .direction = @intFromEnum(self.direction),
            .script = @intFromEnum(self.script),
            .language = self.language.handle,
        };
    }

    pub fn compare(a: SegmentProps, b: SegmentProps) bool {
        return c.hb_segment_properties_equal(&a.cast(), &b.cast()) > 0;
    }

    pub fn hash(self: SegmentProps) u32 {
        return c.hb_segment_properties_hash(&self.cast());
    }

    pub fn overlay(self: *SegmentProps, src: SegmentProps) void {
        var seg_props = self.cast();
        c.hb_segment_properties_overlay(&seg_props, &src.cast());
        self.* = SegmentProps.from(seg_props);
    }
};

pub const ShapePlan = struct {
    handle: *c.hb_shape_plan_t,

    pub fn init(face: Face, props: SegmentProps, features: ?[]const Feature, shapers: Shapers) ShapePlan {
        return .{ .handle = c.hb_shape_plan_create(
            face.handle,
            &props.cast(),
            if (features) |f| @ptrCast(f.ptr) else null,
            if (features) |f| @intCast(f.len) else 0,
            shapers,
        ).? };
    }

    pub fn initCached(face: Face, props: SegmentProps, features: ?[]const Feature, shapers: Shapers) ShapePlan {
        return .{ .handle = c.hb_shape_plan_create_cached(
            face.handle,
            &props.cast(),
            if (features) |f| @ptrCast(f.ptr) else null,
            if (features) |f| @intCast(f.len) else 0,
            shapers,
        ).? };
    }

    pub fn init2(face: Face, props: SegmentProps, features: ?[]const Feature, cords: []const i32, shapers: Shapers) ShapePlan {
        return .{ .handle = c.hb_shape_plan_create2(
            face.handle,
            &props.cast(),
            if (features) |f| @ptrCast(f.ptr) else null,
            if (features) |f| @intCast(f.len) else 0,
            cords.ptr,
            @intCast(cords.len),
            shapers,
        ).? };
    }

    pub fn initCached2(face: Face, props: SegmentProps, features: ?[]const Feature, cords: []const i32, shapers: Shapers) ShapePlan {
        return .{ .handle = c.hb_shape_plan_create_cached2(
            face.handle,
            &props.cast(),
            if (features) |f| @ptrCast(f.ptr) else null,
            if (features) |f| @intCast(f.len) else 0,
            cords.ptr,
            @intCast(cords.len),
            shapers,
        ).? };
    }

    pub fn deinit(self: ShapePlan) void {
        c.hb_shape_plan_destroy(self.handle);
    }

    pub fn execute(self: ShapePlan, font: Font, buffer: Buffer, features: ?[]Feature) error{ShapingFailed}!void {
        if (c.hb_shape_plan_execute(
            self.handle,
            font.handle,
            buffer.handle,
            if (features) |f| @ptrCast(f.ptr) else null,
            if (features) |f| @intCast(f.len) else 0,
        ) < 1) return error.ShapingFailed;
    }

    pub fn getShaper(self: ShapePlan) [:0]const u8 {
        return std.mem.span(@as([*:0]const u8, @ptrCast(c.hb_shape_plan_get_shaper(self.handle))));
    }
};

pub const Tag = struct {
    handle: u32,

    pub fn fromString(str: []const u8) Tag {
        return .{ .handle = c.hb_tag_from_string(str.ptr, @intCast(str.len)) };
    }

    pub fn toString(self: Tag) []const u8 {
        var str: [4]u8 = undefined;
        c.hb_tag_to_string(self.handle, &str[0]);
        return &str;
    }
};

pub const UnicodeIterator = struct {
    set: *c.hb_set_t,
    prev_codepoint: u32 = 0,

    pub fn next(self: *UnicodeIterator) ?u32 {
        var codepoint: u32 = c.HB_SET_VALUE_INVALID;
        return if (c.hb_set_next(self.set, &codepoint) > 1) b: {
            self.prev_codepoint = codepoint;
            break :b codepoint;
        } else null;
    }
};

pub const Variation = extern struct {
    tag: u32,
    value: f32,

    pub fn fromString(str: []const u8) ?Variation {
        var v: Variation = undefined;
        return if (c.hb_variation_from_string(str.ptr, @intCast(str.len), @ptrCast(&v)) > 1)
            v
        else
            null;
    }

    pub fn toString(self: *Variation, buf: []u8) void {
        c.hb_variation_to_string(@ptrCast(self), buf.ptr, @intCast(buf.len));
    }

    pub fn tag(self: Variation) Tag {
        return .{ .handle = self.tag };
    }

    pub fn value(self: Variation) f32 {
        return self.value;
    }
};

const std = @import("std");
const expect = std.testing.expect;

test "reference declarations" {
    std.testing.refAllDecls(@This());
}

test "flags" {
    // GlyphFlags
    try expect(@as(c_int, @bitCast(GlyphFlags{ .unsafe_to_break = true })) == c.HB_GLYPH_FLAG_UNSAFE_TO_BREAK);
    try expect(@as(c_int, @bitCast(GlyphFlags{ .unsafe_to_concat = true })) == c.HB_GLYPH_FLAG_UNSAFE_TO_CONCAT);
    try expect(@as(c_int, @bitCast(GlyphFlags{ .safe_to_insert_tatweel = true })) == c.HB_GLYPH_FLAG_SAFE_TO_INSERT_TATWEEL);
    // SerializeFlags
    try expect(@as(c_int, @bitCast(SerializeFlags{ .no_clusters = true })) == c.HB_BUFFER_SERIALIZE_FLAG_NO_CLUSTERS);
    try expect(@as(c_int, @bitCast(SerializeFlags{ .no_positions = true })) == c.HB_BUFFER_SERIALIZE_FLAG_NO_POSITIONS);
    try expect(@as(c_int, @bitCast(SerializeFlags{ .no_glyph_names = true })) == c.HB_BUFFER_SERIALIZE_FLAG_NO_GLYPH_NAMES);
    try expect(@as(c_int, @bitCast(SerializeFlags{ .glyph_extents = true })) == c.HB_BUFFER_SERIALIZE_FLAG_GLYPH_EXTENTS);
    try expect(@as(c_int, @bitCast(SerializeFlags{ .glyph_flags = true })) == c.HB_BUFFER_SERIALIZE_FLAG_GLYPH_FLAGS);
    try expect(@as(c_int, @bitCast(SerializeFlags{ .no_advances = true })) == c.HB_BUFFER_SERIALIZE_FLAG_NO_ADVANCES);
    // DiffFlags
    try expect(@as(c_int, @bitCast(DiffFlags{ .content_type_mismatch = true })) == c.HB_BUFFER_DIFF_FLAG_CONTENT_TYPE_MISMATCH);
    try expect(@as(c_int, @bitCast(DiffFlags{ .length_mismatch = true })) == c.HB_BUFFER_DIFF_FLAG_LENGTH_MISMATCH);
    try expect(@as(c_int, @bitCast(DiffFlags{ .notdef_present = true })) == c.HB_BUFFER_DIFF_FLAG_NOTDEF_PRESENT);
    try expect(@as(c_int, @bitCast(DiffFlags{ .dotted_circle_present = true })) == c.HB_BUFFER_DIFF_FLAG_DOTTED_CIRCLE_PRESENT);
    try expect(@as(c_int, @bitCast(DiffFlags{ .codepoint_mismatch = true })) == c.HB_BUFFER_DIFF_FLAG_CODEPOINT_MISMATCH);
    try expect(@as(c_int, @bitCast(DiffFlags{ .cluster_mismatch = true })) == c.HB_BUFFER_DIFF_FLAG_CLUSTER_MISMATCH);
    try expect(@as(c_int, @bitCast(DiffFlags{ .glyph_flags_mismatch = true })) == c.HB_BUFFER_DIFF_FLAG_GLYPH_FLAGS_MISMATCH);
    try expect(@as(c_int, @bitCast(DiffFlags{ .position_mismatch = true })) == c.HB_BUFFER_DIFF_FLAG_POSITION_MISMATCH);
    // Buffer.Flags
    try expect(@as(c_int, @bitCast(Buffer.Flags{ .bot = true })) == c.HB_BUFFER_FLAG_BOT);
    try expect(@as(c_int, @bitCast(Buffer.Flags{ .eot = true })) == c.HB_BUFFER_FLAG_EOT);
    try expect(@as(c_int, @bitCast(Buffer.Flags{ .preserve_default_ignorables = true })) == c.HB_BUFFER_FLAG_PRESERVE_DEFAULT_IGNORABLES);
    try expect(@as(c_int, @bitCast(Buffer.Flags{ .remove_default_ignorables = true })) == c.HB_BUFFER_FLAG_REMOVE_DEFAULT_IGNORABLES);
    try expect(@as(c_int, @bitCast(Buffer.Flags{ .do_not_insert_dotted_circle = true })) == c.HB_BUFFER_FLAG_DO_NOT_INSERT_DOTTED_CIRCLE);
    try expect(@as(c_int, @bitCast(Buffer.Flags{ .verify = true })) == c.HB_BUFFER_FLAG_VERIFY);
    try expect(@as(c_int, @bitCast(Buffer.Flags{ .produce_unsafe_to_concat = true })) == c.HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT);
    try expect(@as(c_int, @bitCast(Buffer.Flags{ .produce_safe_to_insert_tatweel = true })) == c.HB_BUFFER_FLAG_PRODUCE_SAFE_TO_INSERT_TATWEEL);
}

fn matchStructs(comptime A: type, comptime B: type) !void {
    const fieldsA = std.meta.fields(A);
    const fieldsB = std.meta.fields(B);
    try expect(fieldsA.len == fieldsB.len);
    inline for (fieldsA, fieldsB) |fieldA, fieldB| {
        try expect(@sizeOf(fieldA.type) == @sizeOf(fieldB.type));
        try expect(@alignOf(fieldA.type) == @alignOf(fieldB.type));
        try expect(std.mem.eql(u8, fieldA.name, fieldB.name));
    }
}

test "structs" {
    try matchStructs(GlyphPosition, c.hb_glyph_position_t);
    try matchStructs(GlyphInfo, c.hb_glyph_info_t);
}
