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
    -- stylua: ignore
    keys = {
      {"sx", function() require("substitute.exchange").operator() end, desc = "Substitute Operator"},
      {"sx", mode = {"x"}, function() require("substitute.exchange").visual() end, desc = "Substitute Visual"},
      {"sxx", function() require("substitute.exchange").line() end, desc = "Substitute Line"},
      {"sxc", function() require("substitute.exchange").cancel() end, desc = "Substitute Cancel"},
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
        { "asc", "desc" },
        { "top", "bottom" },
        { "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" },
        { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" },
      },
      -- preserve text case
      allow_caps_additions = {
        { "enable", "disable" },
      },
    },
  },
}
