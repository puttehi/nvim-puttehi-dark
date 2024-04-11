local t = require("nvim-puttehi-dark.theme")

---@class HighlightConfig Highlight configuration to be mapped into VIM API
local highlights = {
    ColorColumn = { bg = t.comment },
    Conceal = { bg = t.default },
    CurSearch = { link = "IncSearch" },
    -- Cursor = {},
    CursorColumn = { bg = t.bg_bright },
    -- CursorIM = {},
    CursorLine = { bg = t.bg_bright },
    CursorLineNr = { fg = t.text },
    DarkenedPanel = { bg = t.panel },
    DarkenedStatusline = { bg = t.panel },
    DiffAdd = {
        bg = t.bg,
    },
    DiffChange = { bg = t.comment },
    DiffDelete = {
        bg = t.bg,
    },
    DiffText = {
        bg = t.bg,
    },
    diffAdded = { link = "DiffAdd" },
    diffChanged = { link = "DiffChange" },
    diffRemoved = { link = "DiffDelete" },
    Directory = { fg = t.punctuation, bg = t.default },
    -- EndOfBuffer = {},
    ErrorMsg = { fg = t.error, style = "bold" },
    FloatBorder = { fg = t.border },
    FloatTitle = { fg = t.text_bright },
    FoldColumn = { fg = t.text_bright },
    Folded = { fg = t.text, bg = t.panel },
    IncSearch = { fg = t.glowing },
    LineNr = { fg = t.text_bright },
    MatchParen = { fg = t.glowing, style = "bold" }, -- match for parenthesis under cursor / code block
    ModeMsg = { fg = t.info },
    MoreMsg = { fg = t.info },
    NonText = { fg = t.nontext },
    -- custom for inactive window dimming
    WindowActive = { fg = t.text, bg = t.bg },
    Normal = { fg = t.text, bg = t.bg },
    NormalFloat = { fg = t.text, bg = t.bg_float },
    WindowInactive = { fg = t.text, bg = t.bg_float_dark }, -- none doesn't work for transparent for some reason
    NormalNC = { link = "WindowInactive" },
    NvimInternalError = { t.glowing, bg = t.error },
    Pmenu = { fg = t.comment, bg = t.bg_float },
    PmenuSbar = { bg = t.text_bright },
    PmenuSel = { fg = t.text, bg = t.panel_float },
    PmenuThumb = { bg = t.comment },
    Question = { fg = t.done },
    -- QuickFixLine = {},
    -- RedrawDebugNormal = {}
    RedrawDebugClear = { fg = t.glowing, bg = t.warn },
    RedrawDebugComposed = { fg = t.glowing, bg = t.h1 },
    RedrawDebugRecompose = { fg = t.glowing, bg = t.error },
    Search = { fg = t.glowing },
    SpecialKey = { fg = t.h5 },
    SpellBad = { sp = t.error, style = "undercurl" },
    SpellCap = { sp = t.hint, style = "undercurl" },
    SpellLocal = { sp = t.warn, style = "undercurl" },
    SpellRare = { sp = t.hint, style = "undercurl" },
    SignColumn = { fg = t.text, bg = t.default },
    StatusLine = { fg = t.punctuation, bg = t.bg_float },
    StatusLineNC = { fg = t.link, bg = t.bg },
    StatusLineTerm = { link = "StatusLine" },
    StatusLineTermNC = { link = "StatusLineNC" },
    TabLine = { fg = t.link, bg = t.bg_float },
    TabLineFill = { bg = t.bg_float },
    TabLineSel = { fg = t.text, bg = t.panel_float },
    Title = { fg = t.text },
    VertSplit = { fg = t.border, bg = t.border },
    Visual = { fg = t.text, bg = t.bg_float },
    -- VisualNOS = {},
    WarningMsg = { fg = t.warn },
    Whitespace = { fg = t.nontext },
    WildMenu = { link = "IncSearch" },

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant = { fg = t.const }, -- (preferred) any constant
    String = { fg = t.str }, --   a string constant: "this is a string"
    Character = { fg = t.str2 }, --  a character constant: 'c', '\n'
    Number = { fg = t.const2 }, --   a number constant: 234, 0xff
    Boolean = { fg = t.const2 }, --  a boolean constant: TRUE, false
    Float = { fg = t.const2 }, --    a floating point constant: 2.3e10

    Identifier = { fg = t.varname }, -- (preferred) any variable name
    Function = { fg = t.func }, -- function name (also: methods for classes)

    Statement = { fg = t.statement }, -- (preferred) any statement
    Conditional = { fg = t.ifelse }, --  if, then, else, endif, switch, etc.
    Repeat = { fg = t.ifelse }, --   for, do, while, etc.
    Label = { fg = t.func }, --    case, default, etc.
    Operator = { fg = t.link }, -- "sizeof", "+", "*", etc.
    Keyword = { fg = t.keyword }, --  any other keyword
    Exception = { fg = t.func }, --  try, catch, throw

    PreProc = { fg = t.const }, -- (preferred) generic Preprocessor
    Include = { fg = t.const }, --  preprocessor #include
    -- Define        = { }, --   preprocessor #define
    -- Macro         = { }, --    same as Define
    -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

    Type = { fg = t.vartype }, -- (preferred) int, long, char, etc.
    --[[ Structure = { fg = groups.comment }, --  struct, union, enum, etc. ]]
    -- StorageClass  = { }, -- static, register, volatile, etc.
    -- Typedef = { fg = groups.comment }, --  A typedef

    Special = { fg = t.text_bright }, -- (preferred) any special symbol
    -- SpecialChar   = { }, --  special character in a constant
    Tag = { fg = t.punctuation }, --    you can use CTRL-] on this
    Delimiter = { fg = t.warn }, --  character that needs attention
    SpecialComment = { fg = t.comment }, -- special things inside a comment
    -- Debug         = { }, --    debugging statements

    Comment = { fg = t.comment }, -- (preferred) any special symbol

    Underlined = { style = "underline" }, -- (preferred) text that stands out, HTML links
    Bold = { style = "bold" },
    Italic = { style = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { fg = t.error }, -- (preferred) any erroneous construct
    Todo = { fg = t.glowing, style = "bold" }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    qfLineNr = { fg = t.comment },
    qfFileName = { fg = t.text_bright },

    htmlH1 = { fg = t.h1, style = "bold" },
    htmlH2 = { fg = t.h2, style = "bold" },

    -- mkdHeading = { fg = c.orange, style = "bold" },
    -- mkdCode = { bg = c.terminal_black, fg = c.fg },
    mkdCodeDelimiter = { bg = t.bg, fg = t.text },
    mkdCodeStart = { fg = t.h1, style = "bold" },
    mkdCodeEnd = { fg = t.h1, style = "bold" },
    mkdLink = { fg = t.hint, style = "underline" },

    markdownHeadingDelimiter = { fg = t.nontext, style = "bold" },
    markdownCode = { fg = t.comment },
    markdownCodeBlock = { fg = t.h1 },
    markdownH1 = { fg = t.h1, style = "bold" },
    markdownH2 = { fg = t.h2, style = "bold" },
    markdownH3 = { fg = t.h3, style = "bold" },
    markdownH4 = { fg = t.h4, style = "bold" },
    markdownLinkText = { fg = t.hint, style = "underline" },

    debugPC = { bg = t.panel_float }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { bg = t.bg, fg = t.error }, -- used for breakpoint colors in terminal-debug
    DiagnosticError = { fg = t.error },
    DiagnosticHint = { fg = t.hint },
    DiagnosticInfo = { fg = t.info },
    DiagnosticWarn = { fg = t.warn },
    DiagnosticDefaultError = { fg = t.error },
    DiagnosticDefaultHint = { fg = t.hint },
    DiagnosticDefaultInfo = { fg = t.info },
    DiagnosticDefaultWarn = { fg = t.warn },
    DiagnosticFloatingError = { fg = t.error },
    DiagnosticFloatingHint = { fg = t.hint },
    DiagnosticFloatingInfo = { fg = t.info },
    DiagnosticFloatingWarn = { fg = t.warn },
    DiagnosticSignError = { fg = t.error },
    DiagnosticSignHint = { fg = t.hint },
    DiagnosticSignInfo = { fg = t.info },
    DiagnosticSignWarn = { fg = t.warn },
    DiagnosticStatusLineError = { fg = t.error, bg = t.panel },
    DiagnosticStatusLineHint = { fg = t.hint, bg = t.panel },
    DiagnosticStatusLineInfo = { fg = t.info, bg = t.panel },
    DiagnosticStatusLineWarn = { fg = t.warn, bg = t.panel },
    DiagnosticUnderlineError = { sp = t.error, style = "undercurl" },
    DiagnosticUnderlineHint = { sp = t.hint, style = "undercurl" },
    DiagnosticUnderlineInfo = { sp = t.info, style = "undercurl" },
    DiagnosticUnderlineWarn = { sp = t.warn, style = "undercurl" },
    DiagnosticVirtualTextError = { fg = t.error },
    DiagnosticVirtualTextHint = { fg = t.hint },
    DiagnosticVirtualTextInfo = { fg = t.info },
    DiagnosticVirtualTextWarn = { fg = t.warn },

    -- Treesitter
    -- TSAttribute = {},
    -- TSKeywordReturn = { fg = h1 },
    ["@boolean"] = { link = "Boolean" },
    -- TSCharacter = { link = 'Character' },
    ["@comment"] = { link = "Comment" },
    -- TSConditional = { link = 'Conditional' },
    ["@constant"] = { link = "Normal" },
    ["@constant.builtin"] = { link = "Type" },
    -- TSConstMacro = {},
    -- TSConstant = { fg = groups.text },
    ["@constructor"] = { link = "Type" },
    -- TSEmphasis = {},
    TSError = { fg = t.error },
    -- TSException = {},
    ["field"] = { link = "Normal" },
    -- TSFloat = {},
    -- TSFuncMacro = {},
    ["@function"] = { link = "Function" },
    ["@function.call"] = { link = "Normal" },
    ["@function.name"] = { link = "Type" },
    ["@function.builtin"] = { link = "Type" },
    ["@include"] = { link = "Keyword" }, -- import, include etc.
    ["@keyword"] = { link = "Keyword" },
    ["@keyword.function"] = { link = "Keyword" }, -- func, def etc.
    ["@keyword.operator"] = { link = "Keyword" }, -- in, of etc.
    ["@label"] = { fg = t.link },
    -- TSLiteral = {},
    ["@method"] = { fg = t.text_bright },
    ["@namespace"] = { link = "Normal" },
    -- TSNamespace = {},
    -- TSNone = {},
    TSNumber = { link = "Number" },
    ["@operator"] = { link = "Operator" },
    ["@parameter"] = { link = "Normal" },
    -- TSParameterReference = {},
    ["@property"] = { link = "Normal" },
    ["@punctuation.delimiter"] = { fg = t.punctuation },
    ["@punctuation.special"] = { fg = t.punctuation },
    ["@punctuation.bracket"] = { link = "Normal" },
    -- TSRepeat = {},
    -- TSStrike = {},
    ["@string"] = { link = "String" }, -- abc = "abba", call("somestr") etc.
    ["@string.escape"] = { link = "String" }, -- \n, \t etc.
    -- TSStringRegex = {},
    -- TSStringSpecial = { fg = h5 },
    -- TSSymbol = {},
    ["@tag"] = { link = "Tag" },
    ["@tag.delimiter"] = { link = "Tag" },
    ["@tag.attribute"] = { fg = t.link, style = "italic" },
    ["@text"] = { link = "Normal" },
    ["@title"] = { fg = t.h1, style = "bold" },
    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { link = "Type" },
    TSURI = { fg = t.link },
    -- TSUnderline = {},
    ["@variable"] = { link = "Identifier" },
    ["@variable.function"] = { link = "Function" },
    ["@variable.builtin"] = { link = "Identifier" },
    ["@field"] = { link = "Normal" },
    ["@number"] = { link = "Number" }, -- a = 1, call(number=1) etc.

    -- tsx/jsx
    typescriptVariable = { fg = t.h6 },
    typescriptExport = { fg = t.h5 },
    typescriptDefault = { fg = t.h5 },
    typescriptConstraint = { fg = t.h5 },
    typescriptBlock = { fg = t.text },
    typescriptIdentifierName = { fg = t.text_bright },
    typescriptTSInclude = { fg = t.h5 },
    typescriptCastKeyword = { fg = t.text_bright },
    typescriptEnum = { fg = t.nontext },
    typescriptTypeCast = { fg = t.text_bright },
    typescriptParenExp = { fg = t.text_bright },
    typescriptObjectType = { fg = t.comment },

    -- lua
    luaTSConstructor = { fg = t.comment },

    -- css
    cssTSFunction = { fg = t.comment },
    cssTSProperty = { fg = t.h6 },
    cssTSType = { fg = t.h5 },
    cssTSKeyword = { fg = t.comment },
    cssClassName = { fg = t.h1, style = "italic" },
    cssPseudoClass = { fg = t.link, style = "italic" },
    cssDefinition = { fg = t.h6 },
    cssTSError = { link = "cssClassName" },

    -- vim.lsp.buf.document_highlight()
    LspReferenceText = { bg = t.high_contrast.bg, fg = t.high_contrast.fg },
    LspReferenceRead = { bg = t.high_contrast.bg, fg = t.high_contrast.fg },
    LspReferenceWrite = { bg = t.high_contrast.bg, fg = t.high_contrast.fg },

    -- lsp-highlight-codelens
    LspCodeLens = { fg = t.comment }, -- virtual text of code lens
    LspCodeLensSeparator = { fg = t.comment }, -- separator between two or more code lens

    -- nvim-ts-rainbow
    rainbowcol1 = { fg = t.keyword },
    rainbowcol2 = { fg = t.const2 },
    rainbowcol3 = { fg = t.str },
    rainbowcol4 = { fg = t.info },
    rainbowcol5 = { fg = t.operator },
    rainbowcol6 = { fg = t.str2 },
    rainbowcol7 = { fg = t.nontext },

    -- lewis6991/gitsigns.nvim
    GitSignsAdd = { fg = t.git_add },
    GitSignsChange = { fg = t.git_change },
    GitSignsDelete = { fg = t.git_delete },
    SignAdd = { link = "GitSignsAdd" },
    SignChange = { link = "GitSignsChange" },
    SignDelete = { link = "GitSignsDelete" },

    -- folke/which-key.nvim
    WhichKey = { fg = t.glowing }, -- key
    WhichKeyGroup = { fg = t.glowing, style = "bold" }, -- key if its a group
    WhichKeySeparator = { fg = t.punctuation }, -- key-label separator
    WhichKeyDesc = { fg = t.comment }, -- key description
    WhichKeyFloat = { bg = t.panel }, -- floating panel
    WhichKeyBorder = { fg = t.border }, -- border
    WhichKeyValue = { fg = t.text }, -- value if some plugin provides it

    -- hrsh7th/nvim-cmp
    CmpItemAbbr = { fg = t.text_bright },
    CmpItemAbbrDeprecated = { fg = t.error, style = "strikethrough" },
    CmpItemAbbrMatch = { fg = t.text, style = "bold" },
    CmpItemAbbrMatchFuzzy = { fg = t.h5, style = "bold" },
    CmpItemKind = { fg = t.link },
    CmpItemKindClass = { fg = t.warn },
    CmpItemKindFunction = { fg = t.hint },
    CmpItemKindInterface = { fg = t.h6 },
    CmpItemKindMethod = { fg = t.error },
    CmpItemKindSnippet = { fg = t.comment },
    CmpItemKindVariable = { fg = t.h5 },

    -- ray-x/lsp_signature.nvim
    LspSignatureActiveParameter = { bg = t.comment },

    -- nvim-telescope/telescope.nvim
    TelescopeBorder = { fg = t.border },
    TelescopeMatching = { fg = t.glowing },
    TelescopeNormal = { fg = t.text },
    TelescopePromptNormal = { fg = t.text },
    TelescopePromptPrefix = { fg = t.comment },
    TelescopeSelection = { fg = t.text, bg = t.comment },
    TelescopeSelectionCaret = { fg = t.h4, bg = t.comment },
    TelescopeTitle = { fg = t.h1 },
}

--[[ vim.g.terminal_color_0 = groups.bg -- black
vim.g.terminal_color_8 = groups.bg -- bright black
vim.g.terminal_color_1 = groups.error -- red
vim.g.terminal_color_9 = groups.error -- bright red
vim.g.terminal_color_2 = h5 -- green
vim.g.terminal_color_10 = h5 -- bright green
vim.g.terminal_color_3 = groups.warn -- lightYellow1
vim.g.terminal_color_11 = groups.warn -- bright lightYellow1
vim.g.terminal_color_4 = groups.hint -- blue
vim.g.terminal_color_12 = h6 -- bright blue
vim.g.terminal_color_5 = h4 -- magenta
vim.g.terminal_color_13 = h4 -- bright magenta
vim.g.terminal_color_6 = groups.hint -- brightCyan1
vim.g.terminal_color_14 = h6 -- bright brightCyan1
vim.g.terminal_color_7 = groups.glowing -- white
vim.g.terminal_color_15 = groups.glowing -- bright white ]]

return highlights
