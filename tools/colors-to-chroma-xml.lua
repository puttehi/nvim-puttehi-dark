---@alias ChromaToken string
---@alias NeovimHighlight string
---@alias ChromaToNeovimMapping table<ChromaToken,NeovimHighlight|nil>

---@type ChromaToNeovimMapping
local chroma_to_nvim_tbl = {
    -- Meta token types.
    -- Default background style.
    ["Background"] = nil, -- Use given BG param here
    -- PreWrapper style.
    -- PreWrapper -- chroma (pre of code of spans)
    -- Line style.
    -- Line -- line
    -- Line numbers in output.
    -- LineNumbers -- ln
    -- Line numbers in output when in table.
    -- LineNumbersTable -- lnt
    -- Line higlight style.
    -- LineHighlight -- hl
    -- Line numbers table wrapper style.
    -- LineTable -- lntable
    -- Line numbers table TD wrapper style.
    -- LineTableTD -- lntd
    -- Line number links.
    -- LineLink -- lnlinks
    -- Code line wrapper style.
    -- CodeLine -- This wraps a line of code (span of spans)
    -- Input that could not be tokenised.
    -- Error -- Internal token
    -- Other is used by the Delegate lexer to indicate which tokens should be handled by the delegate.
    -- Other -- Internal token
    -- No highlighting.
    -- None -- Internal token probably
    -- Used as an EOF marker / nil token
    -- EOFType -- Internal token probably

    -- Keywords.
    ["Keyword"] = "Keyword",
    ["KeywordConstant"] = "Constant",
    ["KeywordDeclaration"] = "Keyword",
    ["KeywordNamespace"] = "@namespace",
    ["KeywordPseudo"] = "Keyword", -- or cssPseudoClass?
    ["KeywordReserved"] = "Keyword", -- ??
    ["KeywordType"] = "Type",

    -- Names.
    -- Name
    ["NameAttribute"] = "@tag.attribute",
    ["NameBuiltin"] = "@type.builtin",
    ["NameBuiltinPseudo"] = "@type.builtin",
    -- NameClass
    ["NameConstant"] = "Constant",
    -- NameDecorator
    -- NameEntity
    ["NameException"] = "Exception",
    ["NameFunction"] = "Function",
    -- NameFunctionMagic
    ["NameKeyword"] = "@keyword",
    ["NameLabel"] = "@label",
    ["NameNamespace"] = "@namespace",
    ["NameOperator"] = "@operator",
    ["NameOther"] = "Keyword",
    -- NamePseudo
    ["NameProperty"] = "@property",
    ["NameTag"] = "@tag",
    ["NameVariable"] = "Identifier",
    ["NameVariableAnonymous"] = "Identifier",
    ["NameVariableClass"] = "Identifier",
    ["NameVariableGlobal"] = "Identifier",
    ["NameVariableInstance"] = "Identifier",
    ["NameVariableMagic"] = "Identifier",

    -- Literals.
    ["Literal"] = "String",
    ["LiteralDate"] = "String",
    ["LiteralOther"] = "String",

    -- Strings.
    ["LiteralString"] = "String",
    ["LiteralStringAffix"] = "String",
    ["LiteralStringAtom"] = "String",
    ["LiteralStringBacktick"] = "String",
    ["LiteralStringBoolean"] = "String",
    ["LiteralStringChar"] = "String",
    ["LiteralStringDelimiter"] = "String",
    ["LiteralStringDoc"] = "String",
    ["LiteralStringDouble"] = "String",
    ["LiteralStringEscape"] = "String",
    ["LiteralStringHeredoc"] = "String",
    ["LiteralStringInterpol"] = "String",
    ["LiteralStringName"] = "String",
    ["LiteralStringOther"] = "String",
    ["LiteralStringRegex"] = "String",
    ["LiteralStringSingle"] = "String",
    ["LiteralStringSymbol"] = "String",

    -- Literals.
    ["LiteralNumber"] = "Number",
    ["LiteralNumberBin"] = "Number",
    ["LiteralNumberFloat"] = "Number",
    ["LiteralNumberHex"] = "Number",
    ["LiteralNumberInteger"] = "Number",
    ["LiteralNumberIntegerLong"] = "Number",
    ["LiteralNumberOct"] = "Number",

    -- Operators.
    ["Operator"] = "Operator",
    ["OperatorWord"] = "Operator",

    -- Punctuation.
    ["Punctuation"] = "@punctuation.delimiter",

    -- Comments.
    ["Comment"] = "Comment",
    ["CommentHashbang"] = "Comment",
    ["CommentMultiline"] = "Comment",
    ["CommentSingle"] = "Comment",
    ["CommentSpecial"] = "SpecialComment",

    -- Preprocessor "comments".
    ["CommentPreproc"] = "PreProc",
    ["CommentPreprocFile"] = "PreProc",

    -- Generic tokens.
    -- Used for at least markdown highlights
    ["Generic"] = "Normal",
    --GenericDeleted
    --GenericEmph
    ["GenericError"] = "Error",
    ["GenericHeading"] = "markdownH1",
    --GenericInserted
    --GenericOutput
    --GenericPrompt
    --GenericStrong
    ["GenericSubheading"] = "markdownH2",
    --GenericTraceback
    --GenericUnderline

    -- Text.
    ["Text"] = "Normal",
    -- TextWhitespace
    -- TextSymbol
    -- TextPunctuation

    --[[
    -- Aliases.
    -- Whitespace = TextWhitespace

    -- Date = LiteralDate

    -- String          = LiteralString
    -- StringAffix     = LiteralStringAffix
    -- StringBacktick  = LiteralStringBacktick
    -- StringChar      = LiteralStringChar
    -- StringDelimiter = LiteralStringDelimiter
    -- StringDoc       = LiteralStringDoc
    -- StringDouble    = LiteralStringDouble
    -- StringEscape    = LiteralStringEscape
    -- StringHeredoc   = LiteralStringHeredoc
    -- StringInterpol  = LiteralStringInterpol
    -- StringOther     = LiteralStringOther
    -- StringRegex     = LiteralStringRegex
    -- StringSingle    = LiteralStringSingle
    -- StringSymbol    = LiteralStringSymbol

    -- Number            = LiteralNumber
    -- NumberBin         = LiteralNumberBin
    -- NumberFloat       = LiteralNumberFloat
    -- NumberHex         = LiteralNumberHex
    -- NumberInteger     = LiteralNumberInteger
    -- NumberIntegerLong = LiteralNumberIntegerLong
    -- NumberOct         = LiteralNumberOct
    ]]
}

local function deepcopy(o, seen)
    seen = seen or {}
    if o == nil then
        return nil
    end
    if seen[o] then
        return seen[o]
    end

    local no = {}
    seen[o] = no
    setmetatable(no, deepcopy(getmetatable(o), seen))

    for k, v in next, o, nil do
        k = (type(k) == "table") and k:deepcopy(seen) or k
        v = (type(v) == "table") and v:deepcopy(seen) or v
        no[k] = v
    end
    return no
end

---Resolve a PaletteKey from a Theme
---@param palette Palette to resolve from
---@param pk PaletteKey to resolve
---@return string #RRGGBB
local function resolve_from_palette(palette, pk)
    return palette[pk]
end

---Build a Chroma-compatible XML file from the nvim theme so it can later
---be converted into e.g. CSS.
---@param chroma_table ChromaToNeovimMapping
---@param palette Palette
---@param hl_config HighlightConfig
local function highlights_to_chroma_xml_entries(chroma_table, palette, hl_config, background_color)
    ---@alias CSSStyleValue string
    ---@type table<ChromaToken, CSSStyleValue> Translates to <entry type="ChromaToken" style="CSSStyleValue" />
    local background_entry = '<entry type="Background" style="' .. background_color .. '" />'

    local xml_entries = { background_entry }

    for key, value in pairs(chroma_table) do
        local nvim_hl = hl_config[value]
        -- Chromas XML style attribute supports:
        -- "#foregroundRGB bg:#backgroundRGB border:#borderRGB bold nobold italic noitalic underline nounderline inherit noinherit"
        local actual = deepcopy(nvim_hl)
        if actual == nil then
            -- TODO: Dump error
            local err = "Invalid value in chroma_table: "
                .. vim.inspect(value)
                .. "\nhl_config: "
                .. vim.inspect(hl_config)
            vim.notify(err, vim.log.levels.ERROR)
            return
        end
        -- First resolve links
        if actual.link ~= nil then
            -- TODO: Handle links deeper than one level
            ---@type HighlightValue
            actual = hl_config[actual.link]
        end

        -- Then the highlight itself, building the XML
        local styles = {}
        if actual.fg ~= nil then
            table.insert(styles, resolve_from_palette(palette, actual.fg))
        end

        if actual.bg ~= nil then
            table.insert(styles, "bg:" .. resolve_from_palette(palette, actual.bg))
        end

        if actual.style ~= nil then
            if string.find(actual.style, "undercurl") or string.find(actual.style, "underline") then
                table.insert(styles, "underline")
            end
            if string.find(actual.style, "italic") then
                table.insert(styles, "italic")
            end
            if string.find(actual.style, "bold") then
                table.insert(styles, "bold")
            end
        end

        local type = key
        local style = table.concat(styles, " ")
        local entry = '<entry type="' .. type .. '" style="' .. style .. '" />'
        table.insert(xml_entries, "\t" .. entry)
    end

    return xml_entries
end

local plugin = require("nvim-puttehi-dark")

local entries = highlights_to_chroma_xml_entries(
    chroma_to_nvim_tbl,
    plugin.palette,
    plugin.colors,
    resolve_from_palette(plugin.palette, plugin.theme.bg)
)

if entries == nil then
    return
end

local xml = '<style name="nvim-puttehi-dark">\n' .. table.concat(entries, "\n") .. "\n</style>"

vim.notify(xml, vim.log.levels.INFO)
