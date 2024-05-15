return {
  {
    "tpope/vim-dadbod",
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    -- init = function()
    --   -- Your DBUI configuration
    --   vim.g.db_ui_use_nerd_fonts = 1
    -- end,
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    keys = {
      { "<leader>D", desc = "+database" },
      { "<leader>ud", "<cmd>DBUIToggle<cr>", desc = "DB UI Toggle" },
      { "<leader>Df", "<cmd>DBUIFindBuffer<cr>", desc = "DB UI Find Buffer" },
      { "<leader>Dr", "<cmd>DBUIRenameBuffer<cr>", desc = "DB UI Rename Buffer" },
      { "<leader>Dq", "<cmd>DBUILastQueryInfo<cr>", desc = "DB UI Last Query Info" },
    },
  },
}
