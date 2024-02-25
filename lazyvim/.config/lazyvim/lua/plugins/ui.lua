return {
  {
    "rasulomaroff/reactive.nvim",
    opts = {
      builtin = {
        cursorline = true,
        cursor = true,
        modemsg = true,
      },
    },
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    main = "rainbow-delimiters.setup",
    event = "BufEnter",
    opts = {
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
      },
    },
  },

  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      scope = "window",
      colorcolumn = "120",
      disabled_filetypes = {
        "NeogitGitCommandHistory",
        "NeogitLogView",
        "Trouble",
        "dashboard",
        "help",
        "lazy",
        "lspinfo",
        "markdown",
        "mason",
        "neo-tree",
        "noice",
        "text",
      },
    },
  },
}
