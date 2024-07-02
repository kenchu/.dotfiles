return {
  {
    "FabianWirth/search.nvim",
    keys = {
      { "<leader>gc", function() require("search").open { collection = "git" } end, desc = "File browser" },
    },
    opts = function()
      local builtin = require "telescope.builtin"
      local anyBuffer = function() return #vim.fn.getbufinfo { buflisted = 1 } > 0 end
      return {
        mappings = {
          next = { { "L", "n" }, { "<Tab>", "n" }, { "<Tab>", "i" } },
          prev = { { "H", "n" }, { "<S-Tab>", "n" }, { "<S-Tab>", "i" } },
        },
        collections = {
          files = { -- Define a collection named 'files'
            tabs = {
              { name = "Find Files", tele_func = builtin.find_files },
              { name = "Live Grep", tele_func = builtin.live_grep },
            },
          },
          -- Here the "git" collection is defined. It follows the same configuraton layout as tabs.
          git = {
            initial_tab = 2, -- git branches
            tabs = {
              { name = "Branches", tele_func = builtin.git_branches },
              { name = "Commits", tele_func = builtin.git_commits },
              { name = "Stashes", tele_func = builtin.git_stash },
            },
            available = function() return vim.fn.isdirectory ".git" == 1 end,
          },
        },
        -- tabs = {
        --   { name = "Files", tele_func = builtin.find_files, tele_opts = { no_ignore = true, hidden = true } },
        -- },
        append_tabs = { -- append_tabs will add the provided tabs to the default ones
          { "Buffers", builtin.buffers, available = anyBuffer },
          { "Symbols", builtin.lsp_document_symbols, available = anyBuffer },
        },
      }
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "FabianWirth/search.nvim",
      "nvim-telescope/telescope-project.nvim",
      "polirritmico/telescope-lazy-plugins.nvim",
      "tsakirist/telescope-lazy.nvim",
      -- { "agoodshort/telescope-git-submodules.nvim", dependencies = "akinsho/toggleterm.nvim" },
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
      telescope.load_extension "lazy"
      -- telescope.load_extension("git_submodules")
      telescope.load_extension "conventional_commits"
      telescope.load_extension "gitmoji"
      telescope.load_extension "jsonfly"
      telescope.load_extension "docker"
      telescope.load_extension "textcase"
    end,
    -- stylua: ignore
    keys = {
      { "<leader><space>", function() require("search").open() end, desc = "File browser" },
      -- {
      --   "gs",
      --   function()
      --     require("telescope.builtin").lsp_document_symbols({
      --       symbols = require("lazyvim.config").get_kind_filter(),
      --     })
      --   end,
      --   desc = "Goto Symbol",
      -- },
      { "<leader>'",  "<cmd>Telescope resume<cr>",               desc = "Telescope resume" },
      { "<leader>fl", "<cmd>Telescope lazy_plugins<cr>",         desc = "Find Lazy Plugins" },
      { "<leader>fL", "<cmd>Telescope lazy<cr>",                 desc = "Find Lazy" },
      { "<leader>fp", "<cmd>Telescope project<cr>",              desc = "Find projects" },
      { "<leader>gm", "<cmd>Telescope conventional_commits<cr>", desc = "Conventional commit" },
      { "<leader>XX", "<cmd>Telescope textcase<cr>",             desc = "Telescope Text Case", mode = { "n", "v" } },
      { "<leader>sj", "<cmd>Telescope jsonfly<cr>",              desc = "Search JSON", mode = "n", ft = "json" },
      { "<leader>Dd", "<cmd>Telescope docker<cr>",               desc = "Find docker" },
      { "<leader>Di", "<cmd>Telescope docker images<cr>",        desc = "Find docker images" },
      { "<leader>Dc", "<cmd>Telescope docker containers<cr>",    desc = "Find docker containers" },
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
              ["<A-d>"] = actions.delete_buffer,
              ["<A-p>"] = actions_layout.toggle_preview,
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
        -- pickers = {
        --   buffers = {
        --     theme = "flex",
        --   },
        -- },
        extensions = {
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
