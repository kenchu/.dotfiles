return {
  {
    "tpope/vim-dadbod",
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    cmd = { "DB", "DBUI" },
    keys = {
      { "<leader>D", desc = "DB" },
      { "<leader>Du", "<cmd>DBUIToggle<cr>", desc = "DB UI Toggle" },
      { "<leader>Df", "<cmd>DBUIFindBuffer<cr>", desc = "DB UI Find Buffer" },
      { "<leader>Dr", "<cmd>DBUIRenameBuffer<cr>", desc = "DB UI Rename Buffer" },
      { "<leader>Dq", "<cmd>DBUILastQueryInfo<cr>", desc = "DB UI Last Query Info" },
    },
  },
}
