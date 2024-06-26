return {
  {
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    -- stylua: ignore
    keys = {
      { "<leader>::", "<cmd>CompilerOpen<cr>", desc = "Compiler Open" },
      { "<leader>:r", "<cmd>CompilerRedo<cr>", desc = "Compiler Redo" },
      { "<leader>:x", "<cmd>CompilerStop<cr>", desc = "Compiler Stop" },
      { "<leader>:t", "<cmd>CompilerToggleResults<cr>", desc = "Compiler Toggle Results" },
    },
    opts = {},
  },

  {
    "stevearc/overseer.nvim",
    cmd = { "OverseerInfo", "OverseerRun" },
    keys = {
      { "<leader>:i", "<cmd>OverseerInfo<cr>", desc = "OverseerInfo" },
    },
    opts = {
      task_list = {
        direction = "bottom",
        -- min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
  },

  {
    "michaelb/sniprun",
    branch = "master",
    build = "sh install.sh",
    -- do 'sh install.sh 1' if you want to force compile locally
    -- (instead of fetching a binary from the github release). Requires Rust >= 1.65
    event = "VeryLazy",
    config = function()
      require("sniprun").setup({
        -- your options
      })
    end,
  },
}
