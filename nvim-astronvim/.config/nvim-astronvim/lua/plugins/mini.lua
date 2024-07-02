return {
  { "echasnovski/mini.align", version = false, config = true },

  {
    "echasnovski/mini.ai",
    opts = function()
      local ai = require "mini.ai"
      return {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter { -- code block
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          },
          f = ai.gen_spec.treesitter { a = "@function.outer", i = "@function.inner" }, -- function
          c = ai.gen_spec.treesitter { a = "@class.outer", i = "@class.inner" }, -- class
          t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
          d = { "%f[%d]%d+" }, -- digits
          e = { -- Word with case
            { "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
            "^().*()$",
          },
          -- i = LazyVim.mini.ai_indent, -- indent
          -- g = LazyVim.mini.ai_buffer, -- buffer
          u = ai.gen_spec.function_call(), -- u for "Usage"
          U = ai.gen_spec.function_call { name_pattern = "[%w_]" }, -- without dot in function name
        },
      }
    end,
  },

  { "folke/which-key.nvim", enabled = true },
  {
    "echasnovski/mini.clue",
    opts = {
      window = {
        delay = 300,
      },
    },
  },

  {
    "echasnovski/mini.files",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>fm"] = {
                function()
                  if not require("mini.files").close() then require("mini.files").open() end
                end,
                desc = "Find mini-files",
              },
            },
          },
        },
      },
    },
    opts = {},
  },

  {
    "echasnovski/mini.surround",
    opts = {
      -- stylua: ignore
      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        add = "ys",            -- Add surrounding in Normal and Visual modes
        delete = "ds",         -- Delete surrounding
        replace = "cs",        -- Replace surrounding
        find = "sf",           -- Find surrounding (to the right)
        find_left = "sF",      -- Find surrounding (to the left)
        highlight = "sh",      -- Highlight surrounding
        update_n_lines = "sn", -- Update `n_lines`
        suffix_last = "l",     -- Suffix to search with "prev" method
        suffix_next = "n",     -- Suffix to search with "next" method
      },
    },
  },

  {
    "echasnovski/mini.operators",
    version = false,
    opts = {
      -- Each entry configures one operator.
      -- `prefix` defines keys mapped during `setup()`: in Normal mode
      -- to operate on textobject and line, in Visual - on selection.

      -- Evaluate text and replace with output
      evaluate = {
        prefix = "g=",

        -- Function which does the evaluation
        func = nil,
      },

      -- Exchange text regions
      exchange = {
        prefix = "cx",

        -- Whether to reindent new text to match previous indent
        reindent_linewise = true,
      },

      -- Multiply (duplicate) text
      multiply = {
        prefix = "gm",

        -- Function which can modify text before multiplying
        func = nil,
      },

      -- Replace text with register
      replace = {
        prefix = "",

        -- Whether to reindent new text to match previous indent
        reindent_linewise = true,
      },

      -- Sort text
      sort = {
        prefix = "gs",

        -- Function which does the sort
        func = nil,
      },
    },
  },
}
