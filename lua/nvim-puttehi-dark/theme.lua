---@alias GroupKey string Name of a group

---@class Theme These are the theme groups, mapping Palette keys to specific groups
-- used in the color scheme itself.
--
---@see Palette
---@field [GroupKey] PaletteKey Group name => Palette key
local theme = {
    -- Generic
    -- Windows
    bg = "bg_neutral", -- Editor BG
    bg_float = "bg_lighter", -- Floating over bg
    bg_bright = "bg_lightest", -- E.g. floating over float
    bg_float_dark = "bg_dark", -- Floating over bg, but darker variant
    bg_float_dark_float = "bg_light", -- Floating over dark float
    border = "teal", -- Generic border for any of the above

    -- Text
    -- Generic VIM things
    comment = "text_gray",
    link = "cyan_neutral",
    punctuation = "cyan_neutral",
    text = "text_normal", -- Generic text
    text_bright = "text_silver", -- Lighter than text
    glowing = "text_white", -- Lightest text available
    nontext = "blue_dark", -- Generic symbols etc. nontext things
    -- Coding-specific
    const = "text_silver",
    const2 = "yellow_dark",
    str = "blue_light",
    str2 = "cyan_bright",
    varname = "text_normal",
    vartype = "yellow_dark",
    func = "blue_light",
    operator = "cyan_neutral",
    ifelse = "red_bright",
    keyword = "red_bright",

    -- Level/status-related
    error = "red_light",
    hint = "cyan_bright",
    info = "cyan_neutral",
    warn = "yellow_light",

    done = "teal",

    -- Git-related
    git_add = "blue_light",
    git_change = "yellow_dark",
    git_delete = "red_light",
    git_dirty = "blue_dark",
    git_ignore = "text_gray",
    git_merge = "yellow_dark",
    git_rename = "teal",
    git_stage = "cyan_bright",
    git_text = "red_bright",

    -- Headers
    h1 = "yellow_light",
    h2 = "yellow_dark",
    h3 = "blue_light",
    h4 = "blue_dark",
    h5 = "cyan_bright",
    h6 = "cyan_neutral",

    -- For generic text contrasting, good for e.g. highlighting search results etc.
    contrast_bg = "bg_lightest",
    contrast_fg = "yellow_light",
}

return theme
