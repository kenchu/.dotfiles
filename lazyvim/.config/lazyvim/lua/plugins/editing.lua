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

  { "gbprod/substitute.nvim", event = "LazyFile" },

  {
    "nguyenvukhang/nvim-toggler",
    keys = { { "<leader>i", desc = "Toggle CursorWord" } },
    opts = {
      inverses = {
        ["vim"] = "emacs",
        ["top"] = "bottom",
        ["ascending"] = "descending",
        ["horizontal"] = "vertical",
      },
    },
  },

  {
    "chrisgrieser/nvim-spider",
    keys = {
      {
        "w",
        "<cmd>lua require('spider').motion('w')<CR>",
        mode = { "n", "x", "o" },
        desc = "Next word",
      },
      {
        "e",
        "<cmd>lua require('spider').motion('e')<CR>",
        mode = { "n", "x", "o" },
        desc = "Next end of word",
      },
      {
        "b",
        "<cmd>lua require('spider').motion('b')<CR>",
        mode = { "n", "x", "o" },
        desc = "Previous word",
      },
      {
        "ge",
        "<cmd>lua require('spider').motion('ge')<CR>",
        mode = { "n", "x", "o" },
        desc = "Previous end of word",
      },
    },
    opts = {},
  },
}
