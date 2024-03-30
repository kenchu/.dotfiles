-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>h", "<cmd>Dashboard<cr>", { desc = "Dashboard" })

-- window management
vim.keymap.set("n", "<leader>w", "<cmd>w<cr><esc>", { desc = "Write File" })
vim.keymap.set("n", "<leader>ws", "<cmd>sp<cr><esc>", { desc = "Window Split" })
vim.keymap.set("n", "<leader>wv", "<cmd>vsp<cr><esc>", { desc = "Window Vertical Split" })
vim.keymap.set("n", "<leader>wm", "<C-w>o", { desc = "Window Maximize" })

vim.keymap.set("n", "<M-CR>", "o<esc>k", { desc = "New Line Down" })
vim.keymap.set("n", "<M-S-CR>", "O<esc>j", { desc = "New Line Up" })

-- neovide setup
local neovide = {}

neovide.setup = function()
  if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here

    vim.g.neovide_input_macos_alt_is_meta = true
    vim.g.neovide_input_use_logo = true -- true on macOS

    -- quit, write, undo, redo, select-all
    vim.keymap.set({ "n", "v", "i" }, "<D-w>", "<cmd>close<cr>")
    vim.keymap.set({ "n", "v", "i" }, "<D-s>", "<cmd>write<cr>")
    vim.keymap.set({ "n", "v", "i" }, "<D-z>", "<cmd>undo<cr>")
    vim.keymap.set({ "n", "v", "i" }, "<D-S-z>", "<cmd>redo<cr>")
    vim.keymap.set({ "n", "v", "i" }, "<D-a>", "<esc>ggVG")

    -- copy
    vim.keymap.set("n", "<D-c>", '"+yy') -- Copy whole line
    vim.keymap.set("v", "<D-c>", '"+y') -- Copy visual highlight

    -- paste
    vim.keymap.set({ "n", "v" }, "<D-v>", '"+P') -- Paste normal and visual mode
    vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
    vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode

    -- delete
    vim.keymap.set({ "i", "c" }, "<D-BS>", "<C-u>") -- Delete whole line
    vim.keymap.set({ "i", "c" }, "<A-BS>", "<C-w>") -- Delete word backward

    vim.keymap.set({ "n", "v" }, "<D-.>", function()
      vim.lsp.buf.code_action()
    end)

    vim.keymap.set({ "n", "v" }, "<D-/>", function()
      local api = require("Comment.api")
      api.toggle.linewise.current()
    end, { noremap = true, silent = true, desc = "command line" })

    -- zoom in and out
    vim.g.neovide_scale_factor = 1.0
    local change_scale_factor = function(delta)
      vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end
    vim.keymap.set("n", "<D-0>", function()
      vim.g.neovide_scale_factor = 1.0
    end)
    vim.keymap.set("n", "<D-=>", function()
      change_scale_factor(1.25)
    end)
    vim.keymap.set("n", "<D-->", function()
      change_scale_factor(1 / 1.25)
    end)
  end
end

neovide.setup()
-- end of neovide setup
