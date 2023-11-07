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

return {
  "smoka7/hydra.nvim",
  config = function()
    M.side_scroll()
  end,
}
