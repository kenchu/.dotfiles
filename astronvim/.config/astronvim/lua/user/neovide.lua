local M = {}

M.setup = function()
	if vim.g.neovide then
		-- Put anything you want to happen only in Neovide here

		vim.g.neovide_profiler = false

		vim.o.guifont = "JetBrainsMono Nerd Font:h13" -- text below applies for VimScript

		vim.g.neovide_input_macos_alt_is_meta = true
		vim.g.neovide_input_use_logo = true -- true on macOS
		vim.keymap.set({ "n", "v", "i" }, "<D-w>", "<cmd>quit<cr>") -- Paste normal and visual mode
		vim.keymap.set({ "n", "v", "i" }, "<D-s>", "<cmd>write<CR>") -- Save
		vim.keymap.set({ "n", "v", "i" }, "<D-S-z>", "<cmd>redo<cr>") -- Paste normal and visual mode
		vim.keymap.set({ "n", "v", "i" }, "<D-z>", "<cmd>undo<cr>") -- Paste normal and visual mode
		vim.keymap.set("n", "<D-c>", '"+yy') -- Copy line
		vim.keymap.set("v", "<D-c>", '"+y') -- Copy
		vim.keymap.set({ "n", "v" }, "<D-v>", '"+P') -- Paste normal and visual mode
		vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
		vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode

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
		vim.g.neovide_transparency = 0.0
		vim.g.transparency = 0.9
		vim.g.neovide_background_color = "#0f1117" .. alpha()
		vim.g.neovide_floating_blur_amount_x = 2.0
		vim.g.neovide_floating_blur_amount_y = 2.0
		vim.g.neovide_scroll_animation_length = 0.3
		vim.g.neovide_hide_mouse_when_typing = false -- vim.g.neovide_refresh_rate = 60
		-- vim.g.neovide_refresh_rate_idle = 5
		-- vim.g.neovide_fullscreen = false
		-- vim.g.neovide_remember_window_size = true

		-- vim.g.neovide_cursor_animation_length = 0.13
		-- vim.g.neovide_cursor_trail_size = 0.8
		vim.g.neovide_cursor_antialiasing = true
		vim.g.neovide_cursor_animate_in_insert_mode = true
		vim.g.neovide_cursor_vfx_mode = "ripple"
		-- vim.g.neovide_cursor_vfx_opacity = 200.0
		-- vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
		-- vim.g.neovide_cursor_vfx_particle_density = 16.0
		-- vim.g.neovide_cursor_vfx_particle_speed = 4.0
	end
end

return M
