-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- basic keymap
vim.keymap.set("n", "<leader>w", "<cmd>w<cr><esc>", { desc = "Write File" })
vim.keymap.set("n", "<leader>ws", "<cmd>sp<cr><esc>", { desc = "Window Split" })
vim.keymap.set("n", "<leader>wv", "<cmd>vsp<cr><esc>", { desc = "Window Vertical Split" })

-- substitute exchange keymap
vim.keymap.set("n", "sx", require("substitute.exchange").operator, { desc = "Substitute Operator" })
vim.keymap.set("n", "sxx", require("substitute.exchange").line, { desc = "Substitute Line" })
vim.keymap.set("n", "sxc", require("substitute.exchange").cancel, { desc = "Substitute Cancel" })
vim.keymap.set("x", "sx", require("substitute.exchange").visual, { desc = "Substitute Visual" })

-- telescope keymap
vim.keymap.set("n", "<leader>'", require("telescope.builtin").resume, { silent = true, desc = "Telescope Resume" })

-- refactoring
vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")
vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")
vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")
vim.keymap.set("n", "<leader>rI", ":Refactor inline_func")
vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")
vim.keymap.set({ "n", "x" }, "<leader>rr", function()
  require("telescope").extensions.refactoring.refactors()
end, { desc = "Telescope Refactor" })

--- compiler keymap
-- Open compiler
vim.keymap.set("n", "<F6>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Redo last selected option
vim.keymap.set("n", "<S-F6>", function()
  vim.cmd("CompilerStop") -- (Optional, to dispose all tasks before redo)
  vim.cmd("CompilerRedo")
end, { noremap = true, silent = true })

-- Toggle compiler results
vim.keymap.set("n", "<S-F7>", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

-- Overseer keymap
vim.keymap.set("n", "<leader>o", "", { desc = "Overseer" })
vim.keymap.set("n", "<leader>o:", "<cmd>OverseerRun<cr>", { desc = "OverseerRun" })
vim.keymap.set("n", "<leader>oc", "<cmd>OverseerClearCache<cr>", { desc = "OverseerClearCache" })
vim.keymap.set("n", "<leader>oo", "<cmd>OverseerOpen<cr>", { desc = "OverseerOpen" })
vim.keymap.set("n", "<leader>ot", "<cmd>OverseerToggle<cr>", { desc = "OverseerToggle" })
vim.keymap.set("n", "<leader>oi", "<cmd>OverseerInfo<cr>", { desc = "OverseerInfo" })

-- neovide setup
local neovide = {}

neovide.setup = function()
  if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here

    vim.g.neovide_profiler = false

    vim.g.neovide_theme = "auto"
    vim.g.neovide_confirm_quit = true
    vim.g.neovide_input_macos_alt_is_meta = true
    vim.g.neovide_input_use_logo = true -- true on macOS

    -- quit, write, undo, redo, seleect-all
    vim.keymap.set({ "n", "v", "i" }, "<D-w>", "<cmd>quit<cr>")
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

    -- Helper function for transparency formatting
    local alpha = function()
      return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
    end
    -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    -- vim.g.neovide_transparency = 0.0
    -- vim.g.transparency = 0.9
    -- vim.g.neovide_background_color = "#000000" .. alpha()
    vim.g.neovide_floating_blur_amount_x = 2.0
    vim.g.neovide_floating_blur_amount_y = 2.0
    -- vim.g.neovide_refresh_rate = 60
    -- vim.g.neovide_refresh_rate_idle = 5
    -- vim.g.neovide_fullscreen = false
    -- vim.g.neovide_remember_window_size = true

    -- vim.g.neovide_hide_mouse_when_typing = true
    -- vim.g.neovide_touch_deadzone = 6.0
    -- vim.g.neovide_touch_drag_timeout = 0.7
    vim.g.neovide_scroll_animation_length = 0.3
    -- vim.g.neovide_cursor_animation_length = 0.13
    -- vim.g.neovide_cursor_trail_size = 0.8
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_cursor_animate_in_insert_mode = true
    vim.g.neovide_cursor_animate_command_line = true
    -- vim.g.neovide_cursor_vfx_mode = "sonicboom"
    vim.g.neovide_cursor_vfx_mode = "ripple"
    -- vim.g.neovide_cursor_vfx_opacity = 200.0
    -- vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
    -- vim.g.neovide_cursor_vfx_particle_density = 16.0
    -- vim.g.neovide_cursor_vfx_particle_speed = 4.0

    local function set_ime(args)
      if args.event:match("Enter$") then
        vim.g.neovide_input_ime = true
      else
        vim.g.neovide_input_ime = false
      end
    end

    local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

    vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
      group = ime_input,
      pattern = "*",
      callback = set_ime,
    })

    vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
      group = ime_input,
      pattern = "[/\\?]",
      callback = set_ime,
    })
  end
end

neovide.setup()
-- end of neovide setup
