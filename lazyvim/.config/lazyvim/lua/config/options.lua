-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.guifont = "JetBrainsMono Nerd Font:h13"
-- vim.opt.linespace = 4

-- TODO: not sure if it works
vim.o.pumblend = 15

-- for eagle.nvim
vim.o.mousemoveevent = true

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here

  vim.g.neovide_profiler = false
  vim.g.neovide_theme = "dark"
  -- vim.g.neovide_confirm_quit = true

  -- Helper function for transparency formatting
  -- local alpha = function()
  --   return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
  -- end
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_transparency = 0.95
  -- vim.g.transparency = 0.9
  -- vim.g.neovide_background_color = "#000000" .. alpha()
  -- vim.g.neovide_floating_blur_amount_x = 2.0
  -- vim.g.neovide_floating_blur_amount_y = 2.0
  -- vim.g.neovide_floating_shadow = true
  -- vim.g.neovide_floating_z_height = 10
  -- vim.g.neovide_light_angle_degrees = 45
  -- vim.g.neovide_light_radius = 5

  -- vim.g.neovide_refresh_rate = 60
  -- vim.g.neovide_refresh_rate_idle = 5
  -- vim.g.neovide_fullscreen = false
  -- vim.g.neovide_remember_window_size = true

  -- vim.g.neovide_touch_deadzone = 6.0
  -- vim.g.neovide_touch_drag_timeout = 0.7
  -- vim.g.neovide_scroll_animation_length = 0.3
  -- vim.g.neovide_scroll_animation_far_lines = 1
  vim.g.neovide_hide_mouse_when_typing = true
  -- vim.g.neovide_underline_stroke_scale = 1.0
  -- vim.g.neovide_unlink_border_highlights = true

  -- vim.g.neovide_cursor_animation_length = 0.13
  -- vim.g.neovide_cursor_trail_size = 0.8
  -- vim.g.neovide_cursor_antialiasing = true
  -- vim.g.neovide_cursor_animate_in_insert_mode = true
  -- vim.g.neovide_cursor_animate_command_line = true
  -- vim.g.neovide_cursor_unfocused_outline_width = 0.125
  -- vim.g.neovide_cursor_vfx_mode = "sonicboom"
  -- vim.g.neovide_cursor_vfx_mode = "ripple"
  vim.g.neovide_cursor_vfx_mode = "railgun"
  -- vim.g.neovide_cursor_vfx_opacity = 200.0
  -- vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
  vim.g.neovide_cursor_vfx_particle_density = 16.0
  -- vim.g.neovide_cursor_vfx_particle_speed = 10.0
  -- vim.g.neovide_cursor_vfx_particle_phase = 1.5
  -- vim.g.neovide_cursor_vfx_particle_curl = 1.0
end
