return {
  { "echasnovski/mini.align", version = false, event = "LazyFile" },
  { "echasnovski/mini.move", version = false, event = "LazyFile" },
  {
    "echasnovski/mini.files",
    optional = true,
    opts = { windows = { width_preview = 60 } },
  },
  {
    "echasnovski/mini.surround",
    opts = {
      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        add = "sa", -- Add surrounding in Normal and Visual modes
        delete = "sd", -- Delete surrounding
        find = "sf", -- Find surrounding (to the right)
        find_left = "sF", -- Find surrounding (to the left)
        highlight = "sh", -- Highlight surrounding
        replace = "sr", -- Replace surrounding
        update_n_lines = "sn", -- Update `n_lines`

        suffix_last = "l", -- Suffix to search with "prev" method
        suffix_next = "n", -- Suffix to search with "next" method
      },
    },
  },

  -- TODO: alternative plugin
  { "echasnovski/mini.comment", version = false, enabled = false },
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
}
