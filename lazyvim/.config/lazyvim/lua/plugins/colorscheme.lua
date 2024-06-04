return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  {
    "catppuccin",
    opts = {
      background = { light = "macchiato", dark = "mocha" },
      transparent_background = false,
      show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
      term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      integrations = {
        diffview = true,
        -- telescope = {
        --   style = "nvchad",
        -- },
        -- indent_blankline = {
        --   enabled = true,
        --   scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
        --   colored_indent_levels = true,
        -- },
        overseer = true,
      },
    },
  },
}
