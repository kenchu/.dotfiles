local prefix = "<leader>g"

return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      word_diff = true,
      current_line_blame = true,
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> • <summary>",
      current_line_blame_opts = {
        virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
        delay = 200,
      },
    },
  },

  {
    "NeogitOrg/neogit",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    -- opts = {
    --   telescope_sorter = function()
    --     -- return require("telescope").extensions.fzy_native.native_fzy_sorter()
    --     return require("telescope").extensions.zf_native.native_zf_scorer()
    --   end,
    -- },
    cmd = { "Neogit" },
    keys = {
      { prefix .. "n", desc = "+Neogit" },
      { prefix .. "nn", "<cmd>Neogit<cr>", desc = "Open Neogit Tab Page" },
      { prefix .. "nb", "<cmd>Neogit branch<cr>", desc = "Neogit Branch" },
      { prefix .. "nc", "<cmd>Neogit commit<cr>", desc = "Open Neogit Commit Page" },
      { prefix .. "nd", ":Neogit cwd=", desc = "Open Neogit Override CWD" },
      { prefix .. "nk", ":Neogit kind=", desc = "Open Neogit Override Kind" },
    },
  },

  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    cmd = { "DiffviewOpen" },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = { winbar_info = true },
        file_history = { winbar_info = true },
      },
      hooks = {
        diff_buf_read = function(bufnr)
          vim.b[bufnr].view_activated = false
        end,
      },
    },
  },

  { "akinsho/git-conflict.nvim", version = "*", config = true },

  {
    "emmanueltouzery/agitator.nvim",
    keys = {
      {
        prefix .. "b",
        function()
          require("agitator").git_blame_toggle({
            -- formatter = function(r)
            --   return r.author .. " • " .. r.summary
            -- end,
          })
        end,
        desc = "Git Blame",
      },
      {
        prefix .. "t",
        function()
          require("agitator").git_time_machine()
        end,
        desc = "Git Time Machine",
      },
    },
  },

  -- git time machine
  -- {
  --   "fredeeb/tardis.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   event = "VeryLazy",
  --   config = true,
  -- },

  {
    "FabijanZulj/blame.nvim",
    keys = {
      { prefix .. "B", "<cmd>ToggleBlame virtual<cr>", desc = "Git Blame (virtual)" },
    },
    opts = {
      merge_consecutive = false,
    },
  },

  {
    "wintermute-cell/gitignore.nvim",
    keys = {
      { prefix .. "i", "<cmd>Gitignore<cr>", desc = "GitIgnore" },
    },
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
}
