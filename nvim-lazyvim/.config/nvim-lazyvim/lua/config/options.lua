-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.pumblend = 10
vim.o.winblend = 10

vim.diagnostic.config({ float = { border = "rounded" } })

if vim.loop.os_uname().sysname == "Darwin" then
  print("Running on macOS")
else
  print("Not running on macOS")
  vim.o.guifont = "JetBrainsMono Nerd Font:h12"
  vim.o.linespace = 4
end

if vim.g.neovide then
  vim.g.neovide_transparency = 0.97
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_smooth_blink = true
end
