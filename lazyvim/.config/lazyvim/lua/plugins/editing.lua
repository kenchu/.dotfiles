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
    "chrisgrieser/nvim-spider",
    -- stylua: ignore
    keys = {
      { ",b", function() require("spider").motion("b") end, mode = { "n", "o", "x" } },
      { ",e", function() require("spider").motion("e") end, mode = { "n", "o", "x" } },
      { ",w", function() require("spider").motion("w") end, mode = { "n", "o", "x" } },
      { ",ge", function() require("spider").motion("ge") end, mode = { "n", "o", "x" } },
    },
  },

  {
    "lambdalisue/suda.vim",
    keys = { { "<leader>W", "<cmd>SudaWrite<cr>", desc = "Write File (sudo)" } },
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
      {"sx", function() require("substitute.exchange").visual() end, desc = "Substitute Visual", mode = {"x"}},
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
