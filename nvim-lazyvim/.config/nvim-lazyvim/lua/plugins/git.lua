local prefix = "<leader>g"

return {
  {
    "NeogitOrg/neogit",
    opts = {
      -- graph_style = "unicode",
      integrations = {
        diffview = true,
      },
    },
    cmd = { "Neogit" },
    keys = {
      { prefix .. "n", desc = "+neogit" },
      { prefix .. "nt", "<cmd>Neogit<cr>", desc = "[n]eogit" },
      { prefix .. "nb", "<cmd>Neogit branch<cr>", desc = "neogit [b]ranch" },
      { prefix .. "nc", "<cmd>Neogit commit<cr>", desc = "neogit [c]ommit" },
      { prefix .. "nl", "<cmd>Neogit log<cr>", desc = "neogit [l]og" },
      { prefix .. "np", "<cmd>Neogit pull<cr>", desc = "neogit [p]ull" },
      { prefix .. "nP", "<cmd>Neogit push<cr>", desc = "neogit [P]ush" },
      { prefix .. "nr", "<cmd>Neogit rebase<cr>", desc = "neogit [r]ebase" },
      { prefix .. "nd", ":Neogit cwd=", desc = "neogit [d]irectory" },
      { prefix .. "nk", ":Neogit kind=", desc = "neogit [k]ind" },
    },
  },
}
