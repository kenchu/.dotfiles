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
    keys = { { "<leader>W", ":SudaWrite<CR>", desc = "Suda Write" } },
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
}
