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

  -- { "folke/which-key.nvim", enabled = true },
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
                  if not require("mini.files").close() then
                    require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
                  end
                end,
                desc = "Find mini-files",
              },
              ["<Leader>fM"] = {
                function()
                  if not require("mini.files").close() then require("mini.files").open(vim.uv.cwd(), true) end
                end,
                desc = "Find mini-files",
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      require("mini.files").setup(opts)

      local show_dotfiles = true
      local filter_show = function(fs_entry) return true end
      local filter_hide = function(fs_entry) return not vim.startswith(fs_entry.name, ".") end

      local toggle_dotfiles = function()
        show_dotfiles = not show_dotfiles
        local new_filter = show_dotfiles and filter_show or filter_hide
        require("mini.files").refresh { content = { filter = new_filter } }
      end

      local map_split = function(buf_id, lhs, direction, close_on_file)
        local rhs = function()
          local new_target_window
          local cur_target_window = require("mini.files").get_target_window()
          if cur_target_window ~= nil then
            vim.api.nvim_win_call(cur_target_window, function()
              vim.cmd("belowright " .. direction .. " split")
              new_target_window = vim.api.nvim_get_current_win()
            end)

            require("mini.files").set_target_window(new_target_window)
            require("mini.files").go_in { close_on_file = close_on_file }
          end
        end

        local desc = "Open in " .. direction .. " split"
        if close_on_file then desc = desc .. " and close" end
        vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
      end

      local files_set_cwd = function()
        local cur_entry_path = require("mini.files").get_fs_entry().path
        local cur_directory = vim.fs.dirname(cur_entry_path)
        if cur_directory ~= nil then vim.fn.chdir(cur_directory) end
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id

          vim.keymap.set(
            "n",
            opts.mappings and opts.mappings.toggle_hidden or "g.",
            toggle_dotfiles,
            { buffer = buf_id, desc = "Toggle hidden files" }
          )

          vim.keymap.set(
            "n",
            opts.mappings and opts.mappings.change_cwd or "gc",
            files_set_cwd,
            { buffer = args.data.buf_id, desc = "Set cwd" }
          )

          map_split(buf_id, opts.mappings and opts.mappings.go_in_horizontal or "<C-w>s", "horizontal", false)
          map_split(buf_id, opts.mappings and opts.mappings.go_in_vertical or "<C-w>v", "vertical", false)
          map_split(buf_id, opts.mappings and opts.mappings.go_in_horizontal_plus or "<C-w>S", "horizontal", true)
          map_split(buf_id, opts.mappings and opts.mappings.go_in_vertical_plus or "<C-w>V", "vertical", true)
        end,
      })
    end,
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
