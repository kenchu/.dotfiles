return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      options = {
        opt = {
          pumblend = 10,
          winblend = 10,
        },
      },
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    dependencies = {
      { "AstroNvim/astroui", opts = { colorscheme = "catppuccin" } },
    },
    opts = {
      term_colors = true,
      dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      integrations = {
        diffview = true,
        indent_blankline = { colored_indent_levels = true },
        overseer = true,
      },
    },
  },

  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        css = true,
        css_fn = true,
        tailwind = "both",
      },
    },
  },

  {
    "rasulomaroff/reactive.nvim",
    opts = {
      builtin = {
        cursorline = true,
        cursor = true,
        modemsg = true,
      },
    },
  },
}
