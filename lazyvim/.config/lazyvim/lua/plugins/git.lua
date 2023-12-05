local prefix = "<leader>g"

return {
  {
    "wintermute-cell/gitignore.nvim",
    keys = {
      { "<leader>gi", "<cmd>Gitignore<cr>", desc = "GitIgnore" },
    },
  },

  {
    "f-person/git-blame.nvim",
    event = "BufReadPre",
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim", -- optional
    },
    -- config = true,
    opts = {
      telescope_sorter = function()
        -- return require("telescope").extensions.fzy_native.native_fzy_sorter()
        return require("telescope").extensions.zf_native.native_zf_scorer()
      end,
    },
    keys = {
      { prefix .. "n", desc = "Neogit" },
      { prefix .. "nt", "<cmd>Neogit<cr>", desc = "Open Neogit Tab Page" },
      { prefix .. "nc", "<cmd>Neogit commit<cr>", desc = "Open Neogit Commit Page" },
      { prefix .. "nd", ":Neogit cwd=", desc = "Open Neogit Override CWD" },
      { prefix .. "nk", ":Neogit kind=", desc = "Open Neogit Override Kind" },
    },
  },
}
