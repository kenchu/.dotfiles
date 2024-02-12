return {
  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
    opts = {
      mapping = { "jk", "kj" },
      timeout = 300,
    },
  },

  {
    "lambdalisue/suda.vim",
    keys = { { "<leader>W", "<cmd>SudaWrite<cr>", desc = "Suda Write" } },
    cmd = { "SudaRead", "SudaWrite" },
  },

  {
    "gbprod/substitute.nvim",
    event = "LazyFile",
    opts = {
      on_substitute = require("yanky.integration").substitute(),
    },
  },

  {
    "smjonas/inc-rename.nvim",
    config = true,
    keys = {
      {
        "<leader>cr",
        function()
          return ":IncRename " .. vim.fn.expand("<cword>")
        end,
      },
    },
  },

  {
    "nat-418/boole.nvim",
    event = "BufReadPre",
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
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      use_default_keymaps = false,
    },
    keys = {
      { "<leader>j", desc = "Join / split lines" },
      {
        "<leader>jj",
        function()
          require("treesj").toggle()
        end,
        desc = "Treesj Join",
      },
      {
        "<leader>js",
        function()
          require("treesj").split({ spilt = { recursive = true } })
        end,
        desc = "Treesj Join (recursive)",
      },
    },
  },
}
