return {
  {
    "Zeioth/compiler.nvim",
    optional = true,
    keys = {
      { "<leader>::", "<cmd>CompilerOpen<cr>", desc = "Compiler Open" },
      { "<leader>:r", "<cmd>CompilerRedo<cr>", desc = "Compiler Redo" },
      { "<leader>:x", "<cmd>CompilerStop<cr>", desc = "Compiler Stop" },
      { "<leader>:t", "<cmd>CompilerToggleResults<cr>", desc = "Compiler Toggle Results" },
    },
  },

  {
    "stevearc/overseer.nvim",
    optional = true,
    opts = function(_, opts)
      local astrocore = require "astrocore"
      if astrocore.is_available "toggleterm.nvim" then
        opts.strategy = {
          "toggleterm",
          open_on_start = false,
        }
      end
    end,
  },

  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      rooter = {
        -- automatically update working directory (update manually with `:AstroRoot`)
        autochdir = true,
        -- scope of working directory to change ("global"|"tab"|"win")
        scope = "global",
        -- show notification on every working directory change
        notify = false,
      },
      -- options = {
      --   g = {
      --     NODEJS_PACKAGE_MANAGER = "bun",
      --   },
      -- },
    },
  },
}
