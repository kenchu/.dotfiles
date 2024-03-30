return {
  {
    "echasnovski/mini.clue",
    version = false,
    -- dependencies = { "folke/which-key.nvim", enabled = false },
    opts = function()
      local miniclue = require("mini.clue")
      return {
        triggers = {
          -- Leader triggers
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },

          -- Built-in completion
          { mode = "i", keys = "<C-x>" },

          -- `g` key
          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },

          -- `z` key
          { mode = "n", keys = "z" },
          { mode = "x", keys = "z" },

          -- `,` key
          { mode = "n", keys = "," },
          { mode = "x", keys = "," },

          -- `]` & `[` key
          { mode = "n", keys = "]" },
          { mode = "n", keys = "[" },

          -- Marks
          { mode = "n", keys = "'" },
          { mode = "n", keys = "`" },
          { mode = "x", keys = "'" },
          { mode = "x", keys = "`" },

          -- Registers
          { mode = "n", keys = '"' },
          { mode = "x", keys = '"' },
          { mode = "i", keys = "<C-r>" },
          { mode = "c", keys = "<C-r>" },

          -- Window commands
          { mode = "n", keys = "<C-w>" },
        },

        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.z(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows({
            submode_move = true,
            submode_navigate = true,
            submode_resize = true,
          }),

          -- submode for horizontal movements ←/→
          { mode = "n", keys = "zh", postkeys = "z" },
          { mode = "n", keys = "zl", postkeys = "z" },
          { mode = "x", keys = "zh", postkeys = "z" },
          { mode = "x", keys = "zl", postkeys = "z" },

          -- submode for horizontal movements ←/→ (half screen)
          { mode = "n", keys = "zH", postkeys = "z" },
          { mode = "n", keys = "zL", postkeys = "z" },
          { mode = "x", keys = "zH", postkeys = "z" },
          { mode = "x", keys = "zL", postkeys = "z" },

          -- submode for spider movements
          { mode = "n", keys = ",w", postkeys = "," },
          { mode = "n", keys = ",b", postkeys = "," },
          { mode = "x", keys = ",e", postkeys = "," },
          { mode = "x", keys = ",ge", postkeys = "," },

          -- submode for next/prev git hunk
          { mode = "n", keys = "]h", postkeys = "]" },
          { mode = "n", keys = "[h", postkeys = "[" },

          -- normal mode clues
          { mode = "n", keys = "<leader><tab>", desc = "+tab" },
          { mode = "n", keys = "<leader>:", desc = "+overseer" },
          { mode = "n", keys = "<leader>b", desc = "+buffer" },
          { mode = "n", keys = "<leader>c", desc = "+code" },
          { mode = "n", keys = "<leader>d", desc = "+debug" },
          { mode = "n", keys = "<leader>f", desc = "+find" },
          { mode = "n", keys = "<leader>g", desc = "+git" },
          { mode = "n", keys = "<leader>gh", desc = "+git hunk" },
          { mode = "n", keys = "<leader>o", desc = "+ollama" },
          { mode = "n", keys = "<leader>q", desc = "+quit / session" },
          { mode = "n", keys = "<leader>r", desc = "+refactor" },
          { mode = "n", keys = "<leader>s", desc = "+search" },
          { mode = "n", keys = "<leader>t", desc = "+test" },
          { mode = "n", keys = "<leader>u", desc = "+ui" },
          { mode = "n", keys = "<leader>x", desc = "+diagnostics / quickfix" },

          -- visual mode clues
          { mode = "x", keys = "<leader>c", desc = "+code" },
          { mode = "x", keys = "<leader>d", desc = "+debug" },
          { mode = "x", keys = "<leader>g", desc = "+git" },
          { mode = "x", keys = "<leader>gh", desc = "+git hunk" },
          { mode = "x", keys = "<leader>o", desc = "+ollama" },
          { mode = "x", keys = "<leader>r", desc = "+refactor" },
          { mode = "x", keys = "<leader>s", desc = "+search" },
        },
        window = {
          delay = 200,
          config = {
            width = "auto",
            -- border = "double",
          },
        },
      }
    end,
  },
  { "echasnovski/mini.align", version = false, event = "LazyFile" },
  {
    "echasnovski/mini.files",
    opts = {
      windows = { width_preview = 60 },
    },
  },
  {
    "echasnovski/mini.surround",
    opts = {
      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        add = "sa", -- Add surrounding in Normal and Visual modes
        delete = "sd", -- Delete surrounding
        find = "sf", -- Find surrounding (to the right)
        find_left = "sF", -- Find surrounding (to the left)
        highlight = "sh", -- Highlight surrounding
        replace = "sr", -- Replace surrounding
        update_n_lines = "sn", -- Update `n_lines`
        suffix_last = "l", -- Suffix to search with "prev" method
        suffix_next = "n", -- Suffix to search with "next" method
      },
    },
  },
}
