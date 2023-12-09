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
      dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      show_end_of_buffer = true,
      integrations = {
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        -- indent_blankline = {
        --   enabled = true,
        --   scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
        --   colored_indent_levels = true,
        -- },
        overseer = true,
      },
    },
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    main = "rainbow-delimiters.setup",
    event = "BufEnter",
    opts = {
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
      },
    },
  },
}
