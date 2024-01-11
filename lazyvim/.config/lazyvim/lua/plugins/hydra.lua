local M = {}

M.side_scroll = function()
  local Hydra = require("hydra")
  -- local cmd = require("hydra.keymap-util").cmd
  Hydra({
    name = "Side scroll",
    mode = "n",
    body = "z",
    heads = {
      { "h", "5zh" },
      { "l", "5zl", { desc = "←/→" } },
      { "H", "zH" },
      { "L", "zL", { desc = "half screen ←/→" } },
    },
  })
end

M.nvim_spider = function()
  local Hydra = require("hydra")
  local spider = require("spider")
  Hydra({
    name = "nvim-spider",
    -- config = {
    --   color = "pink",
    --   -- hint = "statusline",
    -- },
    mode = { "n", "x", "o" },
    body = ",",
    heads = {
      {
        "w",
        function()
          spider.motion("w")
        end,
        { desc = "Spider-w" },
      },
      {
        "b",
        function()
          spider.motion("b")
        end,
        { desc = "Spider-b" },
      },
      {
        "e",
        function()
          spider.motion("e")
        end,
        { desc = "Spider-e" },
      },
      {
        "ge",
        function()
          spider.motion("ge")
        end,
        { desc = "Spider-ge" },
      },
      { "<esc>", nil, { exit = true, mode = "n" } },
    },
  })
end

return {
  "smoka7/hydra.nvim",
  dependencies = {
    { "chrisgrieser/nvim-spider", lazy = false },
  },
  config = function()
    M.side_scroll()
    M.nvim_spider()
  end,
}

-- {
--   "chrisgrieser/nvim-spider",
--   keys = {
--     {
--       "w",
--       "<cmd>lua require('spider').motion('w')<CR>",
--       desc = "Next word",
--       mode = { "n", "x", "o" },
--     },
--     {
--       "e",
--       "<cmd>lua require('spider').motion('e')<CR>",
--       desc = "Next end of word",
--       mode = { "n", "x", "o" },
--     },
--     {
--       "b",
--       "<cmd>lua require('spider').motion('b')<CR>",
--       desc = "Previous word",
--       mode = { "n", "x", "o" },
--     },
--     {
--       "ge",
--       "<cmd>lua require('spider').motion('ge')<CR>",
--       desc = "Previous end of word",
--       mode = { "n", "x", "o" },
--     },
--   },
--   opts = {},
-- },
