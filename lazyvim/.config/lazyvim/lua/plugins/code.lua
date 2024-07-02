return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
      })
    end,
  },
  {
    "lewis6991/hover.nvim",
    config = function()
      require("hover").setup({
        init = function()
          -- Require providers
          require("hover.providers.lsp")
          require("hover.providers.dap")
          require("hover.providers.gh")
          require("hover.providers.gh_user")
          -- require("hover.providers.jira")
          require("hover.providers.man")
          -- require("hover.providers.dictionary")
        end,
        preview_opts = { border = "single" },
        -- Whether the contents of a currently open hover window should be moved
        -- to a :h preview-window when pressing the hover keymap.
        preview_window = true,
        title = true,
        mouse_providers = { "LSP" },
        mouse_delay = 1000,
      })

      -- Setup keymaps
      vim.keymap.set("n", "K", function()
        if vim.bo.filetype ~= "help" then
          require("hover").hover()
        end
        vim.api.nvim_feedkeys("K", "ni", true)
      end)
      vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
      vim.keymap.set("n", "<C-p>", function()
        require("hover").hover_switch("previous")
      end, { desc = "hover.nvim (previous source)" })
      vim.keymap.set("n", "<C-n>", function()
        require("hover").hover_switch("next")
      end, { desc = "hover.nvim (next source)" })

      -- Mouse support
      vim.keymap.set("n", "<MouseMove>", require("hover").hover_mouse, { desc = "hover.nvim (mouse)" })
      vim.o.mousemoveevent = true
    end,
  },

  -- {
  --   "soulis-1256/eagle.nvim",
  --   -- event = "VeryLazy",
  --   opts = {},
  -- },

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
  -- {
  --   url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
  --   lazy = false, -- important!
  -- },
}
