return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      -- "FabianWirth/search.nvim",
      "jvgrootveld/telescope-zoxide",
      "nvim-telescope/telescope-project.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "polirritmico/telescope-lazy-plugins.nvim",
      "tsakirist/telescope-lazy.nvim",
      -- { "agoodshort/telescope-git-submodules.nvim", dependencies = "akinsho/toggleterm.nvim" },
      "olacin/telescope-cc.nvim",
      "olacin/telescope-gitmoji.nvim",
      "Myzel394/jsonfly.nvim",
      "lpoto/telescope-docker.nvim",
      { "johmsalas/text-case.nvim", opts = { prefix = "<leader>k" } },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("zoxide")
      telescope.load_extension("project")
      telescope.load_extension("file_browser")
      telescope.load_extension("lazy_plugins")
      telescope.load_extension("lazy")
      -- telescope.load_extension("git_submodules")
      telescope.load_extension("conventional_commits")
      telescope.load_extension("gitmoji")
      telescope.load_extension("jsonfly")
      telescope.load_extension("docker")
      telescope.load_extension("textcase")
    end,
    -- stylua: ignore
    keys = {
      { "<leader>'", function() require("telescope.builtin").resume() end, desc = "Telescope Resume" },
      -- { "<leader><space>", function() require("search").open() end, desc = "File browser" },
      { "<leader>fl", "<cmd>Telescope lazy_plugins<cr>",          desc = "Find Lazy Plugins" },
      { "<leader>fL", "<cmd>Telescope lazy<cr>",                  desc = "Find Lazy " },
      { "<leader>fo", "<cmd>Telescope file_browser<cr>",          desc = "File browser" },
      { "<leader>fp", "<cmd>Telescope project<cr>",               desc = "Find projects" },
      { "<leader>fz", "<cmd>Telescope zoxide list<cr>",           desc = "Zoxide list" },
      { "<leader>gm", "<cmd>Telescope conventional_commits<cr>",  desc = "Conventional commit" },
      { "<leader>kk", "<cmd>Telescope textcase<cr>",              desc = "Telescope Text Case", mode = { "n", "v" } },
      { "<leader>sj", "<cmd>Telescope jsonfly<cr>",               desc = "Open json(fly)", mode = "n", ft = "json" },
    },
    opts = function()
      local actions = require("telescope.actions")
      local actions_state = require("telescope.actions.state")
      local actions_layout = require("telescope.actions.layout")
      return {
        defaults = {
          -- prompt_prefix = "🔍 ",
          -- selection_caret = "󰭎 ",
          -- path_display = { "truncate" },
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
        pickers = {
          buffers = {
            theme = "dropdown",
          },
        },
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          },
          project = {
            base_dirs = {
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
          conventional_commits = {
            theme = "dropdown",
          },
          gitmoji = {
            theme = "dropdown",
          },
          docker = {
            theme = "dropdown",
          },
        },
      }
    end,
  },
}
