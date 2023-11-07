-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_augroup("winblend", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
  group = "winblend",
  callback = function()
    if vim.g.neovide then
      vim.o.winblend = vim.g.winblend
      vim.cmd("hi! NormalFloat blend=" .. vim.g.winblend)
    end
  end,
})
