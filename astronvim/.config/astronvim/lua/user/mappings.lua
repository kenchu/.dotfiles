-- local utils = require "astronvim.utils"
-- local get_icon = utils.get_icon
-- local is_available = utils.is_available
-- local ui = require "astronvim.utils.ui"
--
return {
  n = {
    -- ["<leader>fa"] = {
    --   "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>",
    --   desc = "Find Files +hidden",
    -- },

    ["<leader>bn"] = { "]b", desc = "Next Buffer" },

    -- Tab Mappings
    ["<leader>Tn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>Tc"] = { "<cmd>tabclose<cr>", desc = "Close tab" },
    -- a table with the `name` key will register with which-key if it's available
    -- this an easy way to add menu titles in which-key
    ["<leader>T"] = { name = "Tab" },
  },

  c = {
    ["<C-j>"] = { "<Down>" },
    ["<C-k>"] = { "<Up>" },
  },
}
