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
    optional = true,
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
    "NvChad/ui",
    optional = true,
    opts = {
      base46 = { theme = "catppuccin" },
      buttons = {
        { txt = "  Find File", keys = "f", cmd = "Telescope find_files" },
        { txt = "  Recent Files", keys = "o", cmd = "Telescope oldfiles" },
        { txt = "󰈭  Find Word", keys = "w", cmd = "Telescope live_grep" },
        { txt = "󱥚  Themes", keys = "t", cmd = ":lua require('nvchad.themes').open()" },
        { txt = "  Last Session", keys = "s", cmd = "NvCheatsheet" },

        { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },

        {
          txt = function()
            local stats = require("lazy").stats()
            local ms = math.floor(stats.startuptime) .. " ms"
            return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
          end,
          hl = "NvDashLazy",
          no_gap = true,
        },

        { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },
      },
    },
  },

  {
    "NvChad/nvim-colorizer.lua",
    optional = true,
    opts = {
      user_default_options = {
        css = true,
        css_fn = true,
        tailwind = "both",
      },
    },
  },

  -- {
  --   "brenoprata10/nvim-highlight-colors",
  --   optional = true,
  --   opts = {
  --     render = "virtual",
  --   },
  -- },

  -- {
  --   "rasulomaroff/reactive.nvim",
  --   opts = {
  --     builtin = {
  --       cursorline = true,
  --       cursor = true,
  --       modemsg = true,
  --     },
  --   },
  -- },

  -- {
  --   "psjay/buffer-closer.nvim",
  --   opts = {
  --     close_key = "<Leader>c",
  --   },
  -- },

  {
    "sphamba/smear-cursor.nvim",
    cond = function() return vim.g.neovide == nil end,
    opts = {},
  },
}
