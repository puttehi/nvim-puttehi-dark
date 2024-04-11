---@alias ColorCode string Color code for the name, e.g. #AABBCC or "NONE".

---@class Palette This is the color palette for all the colors used in the theme.
-- The colors are named with an easy human readable, like an enum.
---@field [string] ColorCode Color name => Color code
---@enum (key) PaletteKey Name of a color use in the theme
local palette = {
    -- Colorful colors, yellow/green/blue etc. (emphasis)
    yellow_dark = "#E1B800",
    yellow_light = "#FCE94F",
    teal = "#42675A",
    blue_dark = "#3465A4",
    blue_light = "#729FCF",
    cyan_neutral = "#69ABBC",
    cyan_bright = "#89DDFF",
    magenta_neutral = "#AD7FA8",
    pink_light = "#FAE4FC",
    red_light = "#EE5555",
    red_bright = "#EF2929",
    -- Dark colors, black/greyish, can have greenish hue (background)
    bg_dark = "#030303",
    bg_neutral = "#0B0C0B",
    bg_light = "#151715",
    bg_lighter = "#1E211E",
    bg_lightest = "#272B27",
    -- Light colors, greyish/silver/white (text)
    text_gray = "#505050",
    text_normal = "#AAAAAA",
    text_silver = "#D3D7CF",
    text_white = "#EEEEEC",
    text_none = "NONE",
}

return palette
