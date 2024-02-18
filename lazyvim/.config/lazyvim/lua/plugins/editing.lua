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
    keys = {
      {
        "sx",
        function()
          require("substitute.exchange").operator()
        end,
        desc = "Substitute Operator",
      },
      {
        "sx",
        mode = { "x" },
        function()
          require("substitute.exchange").visual()
        end,
        desc = "Substitute Visual",
      },
      {
        "sxx",
        function()
          require("substitute.exchange").line()
        end,
        desc = "Substitute Line",
      },
      {
        "sxc",
        function()
          require("substitute.exchange").cancel()
        end,
        desc = "Substitute Cancel",
      },
    },
    -- vim.keymap.set("n", "sx", require("substitute.exchange").operator, { desc = "Substitute Operator" })
    -- vim.keymap.set("n", "sxx", require("substitute.exchange").line, { desc = "Substitute Line" })
    -- vim.keymap.set("n", "sxc", require("substitute.exchange").cancel, { desc = "Substitute Cancel" })
    -- vim.keymap.set("x", "sx", require("substitute.exchange").visual, { desc = "Substitute Visual" })
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

  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6", --recomended as each new version will have breaking changes
    opts = {},
  },
}
