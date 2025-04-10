return {
  "AstroNvim/astrolsp",
  opts = {
    features = {
      autoformat = true, -- enable or disable auto formatting on start
      signature_help = true,
    },
    mappings = {
      n = {
        ["<leader>lo"] = {
          function() vim.cmd "VtsExec organize_imports" end,
          desc = "Organize Imports",
          cond = function(client, _) return client.name == "vtsls" end,
        },
        ["<M-S-o>"] = {
          function() vim.cmd "VtsExec organize_imports" end,
          desc = "Organize Imports",
          cond = function(client, _) return client.name == "vtsls" end,
        },
      },
    },
  },
}
