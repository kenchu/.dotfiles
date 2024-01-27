return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
      -- "nvim-telescope/telescope-media-files.nvim",
      "nvim-telescope/telescope-project.nvim",
      "natecraddock/telescope-zf-native.nvim",
      "jvgrootveld/telescope-zoxide",
      "dharmx/telescope-media.nvim",
      "olacin/telescope-cc.nvim",
      "ThePrimeagen/refactoring.nvim",
      { "johmsalas/text-case.nvim", config = true },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("file_browser")
      telescope.load_extension("project")
      telescope.load_extension("zf-native")
      telescope.load_extension("zoxide")
      telescope.load_extension("media")
      telescope.load_extension("conventional_commits")
      telescope.load_extension("refactoring")
      telescope.load_extension("textcase")
    end,
    keys = {
      { "<leader>fo", "<cmd>Telescope file_browser<cr>", desc = "File browser" },
      { "<leader>fp", "<cmd>Telescope project<cr>", desc = "Find projects" },
      { "<leader>fz", "<cmd>Telescope zoxide list<cr>", desc = "Zoxide list" },
      { "<leader>gm", "<cmd>Telescope conventional_commits<cr>", desc = "Conventional commit" },
      { "ga.", "<cmd>TextCaseOpenTelescope<cr>", mode = { "n", "v" }, desc = "Text Case Open Telescope" },
    },
    opts = function()
      local actions = require("telescope.actions")
      local actions_state = require("telescope.actions.state")
      local actions_layout = require("telescope.actions.layout")
      return {
        defaults = {
          -- prompt_prefix = "🔍 ",
          -- selection_caret = "󰭎 ",
          path_display = { "truncate" },
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = { prompt_position = "top", preview_width = 0.55 },
            vertical = { mirror = false },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          mappings = {
            n = {
              ["<A-d>"] = actions.delete_buffer,
              ["<A-p>"] = actions_layout.toggle_preview,
            },
            i = {
              ["<ESC>"] = actions.close,
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<A-d>"] = actions.delete_buffer,
              ["<A-p>"] = actions_layout.toggle_preview,
              ["<A-BS>"] = function(prompt_bufnr)
                local current_line = actions_state.get_current_line()
                local current_picker = actions_state.get_current_picker(prompt_bufnr)
                current_line = current_line:match("(.*%w)%W+%w*$") or ""
                current_picker:set_prompt(current_line)
              end,
            },
          },
        },
        extensions = {
          project = {
            base_dirs = {
              { path = "~/repo", max_depth = 2 },
              { path = "~/ghq", max_depth = 4 },
            },
            hidden_files = false, -- default: false
            theme = "dropdown",
            order_by = "asc",
            -- display_type = "full",
            search_by = { "title", "path" },
            sync_with_nvim_tree = true, -- default false
            -- default for on_project_selected = find project files
            -- on_project_selected = function(prompt_bufnr)
            -- 	require("telescope._extensions.project.actions").change_working_directory(prompt_bufnr, false)
            -- 	require("harpoon.ui").nav_file(1)
            -- end,
          },
          ["zf-native"] = {
            -- options for sorting file-like items
            file = {
              -- override default telescope file sorter
              enable = true,
              -- highlight matching text in results
              highlight_results = true,
              -- enable zf filename match priority
              match_filename = true,
            },
            -- options for sorting all other items
            generic = {
              -- override default telescope generic item sorter
              enable = true,
              -- highlight matching text in results
              highlight_results = true,
              -- disable zf filename match priority
              match_filename = false,
            },
          },
        },
      }
    end,
  },
}
