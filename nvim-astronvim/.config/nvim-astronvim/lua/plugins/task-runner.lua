return {
  {
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    -- stylua: ignore
    keys = {
      { "<leader>::", "<cmd>CompilerOpen<cr>",          desc = "Compiler Open" },
      { "<leader>:r", "<cmd>CompilerRedo<cr>",          desc = "Compiler Redo" },
      { "<leader>:x", "<cmd>CompilerStop<cr>",          desc = "Compiler Stop" },
      { "<leader>:t", "<cmd>CompilerToggleResults<cr>", desc = "Compiler Toggle Results" },
    },
    opts = {},
  },
  {
    "stevearc/overseer.nvim",
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 0,
        max_height = 25,
        default_detail = 1,
      },
    },
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      options = {
        g = {
          NODEJS_PACKAGE_MANAGER = "bun",
        },
      },
    },
  },
}
