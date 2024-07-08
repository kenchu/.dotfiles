return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-project.nvim",
      "polirritmico/telescope-lazy-plugins.nvim",
      "olacin/telescope-cc.nvim",
      "olacin/telescope-gitmoji.nvim",
      "Myzel394/jsonfly.nvim",
      "lpoto/telescope-docker.nvim",
      { "johmsalas/text-case.nvim", opts = { prefix = "<leader>X" } },
    },
    config = function(_, opts)
      local telescope = require "telescope"
      telescope.setup(opts)
      telescope.load_extension "project"
      telescope.load_extension "lazy_plugins"
      telescope.load_extension "conventional_commits"
      telescope.load_extension "gitmoji"
      telescope.load_extension "jsonfly"
      telescope.load_extension "docker"
      telescope.load_extension "textcase"
    end,
    -- stylua: ignore
    keys = {
      { "<Leader><Space>",  "<Cmd>Telescope find_files<CR>",     desc = "Telescope Files " },
      { "<Leader>'",  "<Cmd>Telescope resume<CR>",               desc = "Telescope Resume" },
      { "<Leader>fl", "<Cmd>Telescope lazy_plugins<CR>",         desc = "Find Lazy Plugins" },
      { "<Leader>fp", "<Cmd>Telescope project<CR>",              desc = "Find Projects" },
      { "<Leader>gm", "<Cmd>Telescope conventional_commits<CR>", desc = "Conventional Commit" },
      { "<Leader>XX", "<Cmd>Telescope textcase<CR>",             desc = "Telescope Text Case", mode = { "n", "v" } },
      { "<Leader>sj", "<Cmd>Telescope jsonfly<CR>",              desc = "Find Json", mode = "n", ft = "json" },
      { "<Leader>Dd", "<Cmd>Telescope docker<CR>",               desc = "Find Docker" },
      { "<Leader>Di", "<Cmd>Telescope docker images<CR>",        desc = "Find Docker Images" },
      { "<Leader>Dc", "<Cmd>Telescope docker containers<CR>",    desc = "Find Docker Containers" },
    },
    opts = function()
      local actions = require "telescope.actions"
      local actions_state = require "telescope.actions.state"
      local actions_layout = require "telescope.actions.layout"
      return {
        defaults = {
          -- prompt_prefix = "🔍 ",
          -- selection_caret = "󰭎 ",
          -- path_display = { "truncate" },
          sorting_strategy = "ascending",
          layout_strategy = "flex",
          layout_config = {
            flex = {
              flip_columns = 120,
            },
            horizontal = {
              prompt_position = "top",
              -- preview_width = 0.55,
            },
            vertical = {
              prompt_position = "top",
              mirror = true,
            },
            -- width = 0.87,
            -- height = 0.80,
            -- preview_cutoff = 120,
          },
          mappings = {
            n = {
              ["<M-d>"] = actions.delete_buffer,
              ["<M-p>"] = actions_layout.toggle_preview,
            },
            i = {
              ["<ESC>"] = actions.close,
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<M-d>"] = actions.delete_buffer,
              ["<M-p>"] = actions_layout.toggle_preview,
              ["<M-BS>"] = function(prompt_bufnr)
                local current_line = actions_state.get_current_line()
                local current_picker = actions_state.get_current_picker(prompt_bufnr)
                current_line = current_line:match "(.*%w)%W+%w*$" or ""
                current_picker:set_prompt(current_line)
              end,
            },
          },
        },
        pickers = {
          buffers = { theme = "dropdown" },
        },
        extensions = {
          lazy_plugins = {
            lazy_config = vim.fn.stdpath "config" .. "/lua/lazy_setup.lua", -- path to the file containing the lazy opts and setup() call.
            lazy_spec_table = vim.fn.stdpath "config" .. "/lua/community.lua", -- path to the file containing the lazy plugin spec table.
          },
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          },
          project = {
            base_dirs = {
              { path = "~/.config", max_depth = 2 },
              { path = "~/repo", max_depth = 2 },
              { path = "~/ghq", max_depth = 4 },
            },
            hidden_files = false, -- default: false
            theme = "dropdown",
            order_by = "recent", -- asc | desc | recent
            -- display_type = "full",
            search_by = { "title", "path" },
            sync_with_nvim_tree = true, -- default false
            -- default for on_project_selected = find project files
            -- on_project_selected = function(prompt_bufnr)
            -- 	require("telescope._extensions.project.actions").change_working_directory(prompt_bufnr, false)
            -- 	require("harpoon.ui").nav_file(1)
            -- end,
          },
          conventional_commits = { theme = "dropdown" },
          gitmoji = { theme = "dropdown" },
          docker = { theme = "dropdown" },
        },
      }
    end,
  },

  -- {
  --   "FabianWirth/search.nvim",
  --   keys = {
  --     { "<Leader><Space>", function() require("search").open() end, desc = "Telescope Search" },
  --     { "<leader>gc", function() require("search").open { collection = "git" } end, desc = "File browser" },
  --   },
  --   opts = function()
  --     local builtin = require "telescope.builtin"
  --     local anyBuffer = function() return #vim.fn.getbufinfo { buflisted = 1 } > 0 end
  --     return {
  --       mappings = {
  --         next = { { "L", "n" }, { "<Tab>", "n" }, { "<Tab>", "i" } },
  --         prev = { { "H", "n" }, { "<S-Tab>", "n" }, { "<S-Tab>", "i" } },
  --       },
  --       collections = {
  --         files = { -- Define a collection named 'files'
  --           tabs = {
  --             { name = "Find Files", tele_func = builtin.find_files },
  --             { name = "Live Grep", tele_func = builtin.live_grep },
  --           },
  --         },
  --         -- Here the "git" collection is defined. It follows the same configuraton layout as tabs.
  --         git = {
  --           initial_tab = 2, -- git branches
  --           tabs = {
  --             { name = "Branches", tele_func = builtin.git_branches },
  --             { name = "Commits", tele_func = builtin.git_commits },
  --             { name = "Stashes", tele_func = builtin.git_stash },
  --           },
  --           available = function() return vim.fn.isdirectory ".git" == 1 end,
  --         },
  --       },
  --       -- tabs = {
  --       --   { name = "Files", tele_func = builtin.find_files, tele_opts = { no_ignore = true, hidden = true } },
  --       -- },
  --       append_tabs = { -- append_tabs will add the provided tabs to the default ones
  --         { "Buffers", builtin.buffers, available = anyBuffer },
  --         { "Symbols", builtin.lsp_document_symbols, available = anyBuffer },
  --       },
  --     }
  --   end,
  -- },
}
