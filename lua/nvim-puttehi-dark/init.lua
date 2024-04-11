---@class ColorPluginModule The main module the user sets up
M = {}

---@class ColorPluginOpts Overrides for default options
---@field colors? HighlightConfig Any highlight configuration overrides (untested)

---@param palette Palette Palette to use for lookups if color was not already valid
---@param color ColorCode | string #RRGGBB, "none", "NONE" or vim color code like "Pink"
local function parse_color(palette, color)
    local color_type = type(color)
    if color_type ~= "string" then
        print(vim.inspect({ "invalid color", color_type, color }))
        return
    end

    if color:find("#") then
        -- Was #RRGGBB
        return color
    end

    if color == "none" or color == "NONE" then
        return "none"
    end

    local palette_color = palette[color]
    if palette_color then
        -- Was a palette group name, return underlying #RRGGBB
        return parse_color(palette, palette_color)
    end

    -- Was not #RRGGBB and not found in palette -> Try to find named color from nvim
    return vim.api.nvim_get_color_by_name(color)
end

---@param hl HighlightKey VIM highlight to set
---@param value HighlightValue Highlight configuration to use
function M.apply_highlight(hl, value)
    local style = value.style and "gui=" .. value.style or "gui=NONE"
    local fg = value.fg and "guifg=" .. parse_color(M.palette, value.fg) or "guifg=NONE"
    local bg = value.bg and "guibg=" .. parse_color(M.palette, value.bg) or "guibg=NONE"
    local sp = value.sp and "guisp=" .. parse_color(M.palette, value.sp) or ""

    vim.cmd(string.format("highlight %s %s %s %s %s", hl, style, fg, bg, sp))

    if value.link then
        vim.cmd(string.format("highlight! link %s %s", hl, value.link))
    end
end

---Setup the module options
---@param opts? ColorPluginOpts
function M.setup(opts)
    opts = opts or {}
    M.palette = require("nvim-puttehi-dark.palette")
    M.theme = require("nvim-puttehi-dark.theme")
    M.colors = vim.tbl_deep_extend("force", require("nvim-puttehi-dark.highlights").make(M.theme), opts.colors or {})
    M.apply()
end

function M.apply()
    -- Reset existing highlights
    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    -- Enable full colors
    vim.opt.termguicolors = true
    -- Set color scheme
    vim.g.colors_name = "puttehi_dark"

    -- Set new highlights
    for group_key, palette_key in pairs(M.colors) do
        M.apply_highlight(group_key, palette_key)
    end
end

return M
