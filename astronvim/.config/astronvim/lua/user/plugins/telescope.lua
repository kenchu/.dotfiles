return {
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function() require("telescope").load_extension "file_browser" end,
    keys = {
      { "<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "File browser" },
    },
  },

  {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = { "kkharji/sqlite.lua" },
    config = function() require("telescope").load_extension "frecency" end,
    keys = {
      { "<leader><leader>", "<cmd>Telescope frecency<cr>", { noremap = true, silent = true }, desc = "Find frecency" },
    },
  },

  {
    "cljoly/telescope-repo.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function() require("telescope").load_extension "repo" end,
    keys = {
      { "<leader>fp", "<cmd>Telescope repo list<cr>", { noremap = true, silent = true }, desc = "Find projects" },
    },
  },

  -- {
  --   "nvim-telescope/telescope.nvim",
  --   config = function() require("telescope").load_extension "scope" end,
  --   keys = {
  --     { "<leader>fs", "<cmd>Telescope scope buffer<cr>", { noremap = true, silent = true }, desc = "Scope" },
  --   },
  -- },
}
