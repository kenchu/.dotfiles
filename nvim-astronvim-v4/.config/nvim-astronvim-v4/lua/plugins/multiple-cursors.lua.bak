return {
  {
    "brenton-leighton/multiple-cursors.nvim",
    cmd = {
      "MultipleCursorsAddDown",
      "MultipleCursorsAddUp",
      "MultipleCursorsMouseAddDelete",
      "MultipleCursorsAddMatches",
      "MultipleCursorsAddMatchesV",
      "MultipleCursorsAddJumpNextMatch",
      "MultipleCursorsJumpNextMatch",
      "MultipleCursorsLock",
    },
    opts = {},

    dependencies = {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<Leader>M"
        -- stylua: ignore
        for lhs, map in pairs {
          [prefix .. "a"] = { "<Cmd>MultipleCursorsAddMatches<CR>", desc = "Add cursor matches" },
          [prefix .. "A"] = { "<Cmd>MultipleCursorsAddMatchesV<CR>", desc = "Add cursor matches in previous visual area" },
          [prefix .. "j"] = { "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", desc = "Add cursor and jump to next match" },
          [prefix .. "J"] = { "<Cmd>MultipleCursorsJumpNextMatch<CR>", desc = "Move cursor to next match" },
          [prefix .. "l"] = { "<Cmd>MultipleCursorsLock<CR>", desc = "Lock virtual cursors" },
          ["<D-d>"]       = { "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", desc = "Add cursor and jump to next match" },
          ["<D-S-l>"]     = { "<Cmd>MultipleCursorsAddMatches<CR>", desc = "Add cursor matches" },
        } do
          maps.n[lhs] = map
          maps.x[lhs] = map
        end
        for lhs, map in pairs {
          ["<D-M-Down>"] = { "<Cmd>MultipleCursorsAddDown<CR>", desc = "Add cursor down" },
          ["<D-M-Up>"] = { "<Cmd>MultipleCursorsAddUp<CR>", desc = "Add cursor up" },
          ["<M-LeftMouse>"] = { "<Cmd>MultipleCursorsMouseAddDelete<CR>", desc = "Add cursor with mouse" },
        } do
          maps.n[lhs] = map
          maps.i[lhs] = map
        end
      end,
    },
  },
}
