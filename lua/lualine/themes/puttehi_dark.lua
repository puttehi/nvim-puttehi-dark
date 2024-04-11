-- Lualine uses vim.api.nvim_get_runtime_file to try to load a theme when using { theme = "auto" } with its setup
-- So we name the file according to our color scheme
-- https://github.com/nvim-lualine/lualine.nvim/blob/0a5a66803c7407767b799067986b4dc3036e1983/lua/lualine/utils/loader.lua#L215
local palette = require("nvim-puttehi-dark.palette")

-- powerline colors
local lualine_palette = {
    white = palette.text_white or "#ffffff", -- insert bg a, replace fg a
    green_dark = palette.teal or "#005f00", -- normal fg a
    green_bright = "#afdf00", -- normal bg a
    cyan_neutral = palette.cyan_neutral or "#005f5f", -- insert fg a
    cyan_bright = palette.cyan_bright or "#87dfff", -- insert fg b c, insert bg b
    cblue_dark = palette.blue_dark or "#005f87", -- insert fg c
    red_light = palette.red_light or "#870000", -- visual fg a
    red_bright = palette.red_bright or "#df0000", -- replace bg a
    yellow_dark = palette.yellow_dark or "#ff8700", -- visual bg a
    darker = palette.background2, -- inactive fg a b, normal bg c
    dark = "#262626",
    gray_dark = palette.text_gray or "#606060", -- inactive bg a b, inactive fg c, normal bg b
    gray = "#9e9e9e", -- normal fg b
    gray_light = palette.text_silver or "#f0f0f0", -- normal fg b
}

return {
    normal = {
        a = {
            fg = lualine_palette.green_dark,
            bg = lualine_palette.green_bright,
            gui = "bold",
        },
        b = {
            fg = lualine_palette.gray_light,
            bg = lualine_palette.gray_dark,
        },
        c = {
            fg = lualine_palette.gray,
            bg = lualine_palette.dark,
        },
    },
    insert = {
        a = {
            fg = lualine_palette.cyan_neutral,
            bg = lualine_palette.white,
            gui = "bold",
        },
        b = {
            fg = lualine_palette.cyan_neutral,
            bg = lualine_palette.cyan_bright,
        },
        c = {
            fg = lualine_palette.cyan_bright,
            bg = lualine_palette.cblue_dark,
        },
    },
    replace = {
        a = {
            fg = lualine_palette.white,
            bg = lualine_palette.red_bright,
            gui = "bold",
        },
    },
    visual = {
        a = {
            fg = lualine_palette.red_light,
            bg = lualine_palette.yellow_dark,
            gui = "bold",
        },
    },
    inactive = {
        a = {
            fg = lualine_palette.yellow_dark,
            bg = lualine_palette.gray_dark,
            gui = "bold",
        },
        b = {
            fg = lualine_palette.dark,
            bg = lualine_palette.gray_dark,
            gui = "bold",
        },
        c = {
            fg = lualine_palette.gray_dark,
            bg = lualine_palette.darker,
        },
    },
}
