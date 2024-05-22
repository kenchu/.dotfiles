return {
  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
    opts = {
      mapping = { "jk", "kj" },
      timeout = 300,
    },
  },

  { "NStefan002/visual-surround.nvim", event = "VeryLazy", config = true },

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
}
