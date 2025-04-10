return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    opts.section.buttons.val = {
      opts.button("n", "  New File", "<cmd>enew <bar> startinsert<cr>"),
      opts.button("f", "  Find File", "<cmd>Telescope find_files<cr>"),
      opts.button("o", "  Old File", "<cmd>Telescope oldfiles<cr>"),
      opts.button("w", "  Find Text", "<cmd>Telescope live_grep<cr>"),
      opts.button("p", "  Project", "<cmd>Telescope project<cr>"),
      opts.button("z", "  Zoxide", "<cmd>Telescope zoxide list<cr>"),
      opts.button("s", "  Load Session", "<cmd>lua require('resession').load()<cr>"),
      opts.button("l", "  Lazy", "<cmd>Lazy<cr>"),
      opts.button(
        "a",
        "  Astronvim Configuration",
        function() require("telescope.builtin").find_files { cwd = vim.fn.stdpath "config" } end
      ),
      opts.button("q", "  Quit Neovim", ":qa<CR>"),
    }
  end,
}
