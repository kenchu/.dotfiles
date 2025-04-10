-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      formats = {
        key = function(item) return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } } end,
      },

      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 2 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 2 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
        { section = "startup" },
      },

      preset = {
        -- header = table.concat({
        --   "My Custom",
        --   "Dashboard Header",
        -- }, "\n"),
        -- keys = {
        --   {
        --     action = "<leader>fp",
        --     desc = " Projects",
        --     icon = " ",
        --     key = "p",
        --   },
        -- },
      },
    },
  },
}
