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
    "Rawnly/gist.nvim",
    dependencies = {
      {
        "samjwill/nvim-unception",
        lazy = false,
        init = function()
          vim.g.unception_block_while_host_edits = true
        end,
      },
    },
    cmd = { "GistCreate", "GistCreateFromFile", "GistsList" },
    opts = {
      list = {
        -- If there are multiple files in a gist you can scroll them,
        -- with vim-like bindings j/k next previous
        mappings = {
          next_file = "<C-j>",
          prev_file = "<C-k>",
        },
      },
    },
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim", -- optional
    },
    config = true,
    -- opts = {
    --   telescope_sorter = function()
    --     -- return require("telescope").extensions.fzy_native.native_fzy_sorter()
    --     return require("telescope").extensions.zf_native.native_zf_scorer()
    --   end,
    -- },
    keys = {
      { prefix .. "n", desc = "Neogit" },
      { prefix .. "nt", "<cmd>Neogit<cr>", desc = "Open Neogit Tab Page" },
      { prefix .. "nc", "<cmd>Neogit commit<cr>", desc = "Open Neogit Commit Page" },
      { prefix .. "nd", ":Neogit cwd=", desc = "Open Neogit Override CWD" },
      { prefix .. "nk", ":Neogit kind=", desc = "Open Neogit Override Kind" },
    },
  },
}
