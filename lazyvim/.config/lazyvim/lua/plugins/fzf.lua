return {
  {
    "ibhagwan/fzf-lua",
    optional = true,
    opts = {
      keymap = {
        builtin = {
          ["<A-p>"] = "toggle-preview",
          ["<A-r>"] = "toggle-preview-cw",
          ["<A-S-r>"] = "toggle-preview-ccw",
        },
      },
    },
  },
}
