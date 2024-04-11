# Neovim colorscheme: Puttehi dark

My personal color scheme for neovim, extrapolated from my local generic color scheme.

It's dark and does not have too many colors in general, but tries to still be easy to grok.

## Usage

### Lazy

```lua
{
    "puttehi/nvim-puttehi-dark",
    opts = {},
    config = function(_,_)
        require("nvim-puttehi-dark").setup()
        vim.cmd.colorscheme("puttehi-dark")
    end
}
```

### Overriding or adding highlights

You can pass in `opts` with the format:

```lua
opts = {
  -- Palette name,  RGB name, vim color name or "none" / "NONE" to disable
  SomeHighlight = { fg = "text_normal", bg = "#123456", sp = "red", style = "bold" }
  -- Use link to link to an existing highlight group
  SomeOtherHighlight = { link = "SomeHighlight" }
}
```

