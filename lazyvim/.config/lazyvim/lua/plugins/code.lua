return {
  {
    "soulis-1256/eagle.nvim",
    -- event = "VeryLazy",
    opts = {},
  },

  {
    "cshuaimin/ssr.nvim",
    dependencies = { "nvim-pack/nvim-spectre", enabled = false },
    opts = {},
    keys = {
      {
        "<leader>sr",
        function()
          require("ssr").open()
        end,
        desc = "Structural Search Replace",
        mode = { "n", "x" },
      },
    },
  },

  {
    "chrisgrieser/nvim-various-textobjs",
    lazy = false,
    opts = { useDefaultKeymaps = true },
  },

  {
    "sustech-data/wildfire.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        node_decremental = "<S-CR>",
      },
    },
  },

  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      use_default_keymaps = false,
    },
    -- stylua: ignore
    keys = {
      {"<leader>j", function() require("treesj").toggle() end, desc = "Join / Split"},
    },
  },

  {
    "smjonas/inc-rename.nvim",
    config = true,
    keys = {
      -- stylua: ignore
      {"<leader>cr", function() return ":IncRename " .. vim.fn.expand("<cword>") end},
    },
  },

  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      { "gc", mode = { "n", "v" }, desc = "Comment toggle linewise" },
      { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
    },
    opts = function()
      local commentstring_avail, commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
      return commentstring_avail and commentstring and { pre_hook = commentstring.create_pre_hook() } or {}
    end,
  },

  -- TODO: not working
  {
    url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
    lazy = false, -- important!
  },
}
