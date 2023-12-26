return {
  {
    "lambdalisue/suda.vim",
    keys = { { "<leader>W", ":SudaWrite<CR>", desc = "Suda Write" } },
    cmd = { "SudaRead", "SudaWrite" },
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
    opts = {
      mapping = { "jk", "kj" },
      timeout = 300,
    },
  },

  {
    "gbprod/substitute.nvim",
    event = "LazyFile",
    opts = {
      on_substitute = require("yanky.integration").substitute(),
    },
  },

  {
    "nat-418/boole.nvim",
    opts = {
      mappings = {
        increment = "<C-a>",
        decrement = "<C-x>",
      },
      -- User defined loops
      additions = {
        { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" },
        { "asc", "desc" },
        { "top", "bottom" },
        { "vim", "emacs" },
      },
      allow_caps_additions = {
        { "enable", "disable" },
        -- enable → disable
        -- Enable → Disable
        -- ENABLE → DISABLE
      },
    },
  },

  {
    "chrisgrieser/nvim-spider",
    lazy = false,
  },

  -- {
  --   "chrisgrieser/nvim-spider",
  --   keys = {
  --     {
  --       "w",
  --       "<cmd>lua require('spider').motion('w')<CR>",
  --       desc = "Next word",
  --       mode = { "n", "x", "o" },
  --     },
  --     {
  --       "e",
  --       "<cmd>lua require('spider').motion('e')<CR>",
  --       desc = "Next end of word",
  --       mode = { "n", "x", "o" },
  --     },
  --     {
  --       "b",
  --       "<cmd>lua require('spider').motion('b')<CR>",
  --       desc = "Previous word",
  --       mode = { "n", "x", "o" },
  --     },
  --     {
  --       "ge",
  --       "<cmd>lua require('spider').motion('ge')<CR>",
  --       desc = "Previous end of word",
  --       mode = { "n", "x", "o" },
  --     },
  --   },
  --   opts = {},
  -- },
}
