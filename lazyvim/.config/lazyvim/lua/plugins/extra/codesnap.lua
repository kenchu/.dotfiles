return {
  {
    "mistricky/codesnap.nvim",
    build = "make",
    cmd = { "CodeSnap", "CodeSnapSave" },
    opts = {
      bg_theme = "sea",
      title = "this is title",
      has_breadcrumbs = true,
      code_font_family = "JetBrainsMono Nerd Font",
      -- watermark_font_family = "Pacifico",
      watermark = "Ken Chu",
      save_path = "~/Desktop",
    },
  },
}
