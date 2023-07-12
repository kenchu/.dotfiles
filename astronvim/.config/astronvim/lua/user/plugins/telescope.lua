local actions = require("telescope.actions")

return {

	{
		"telescope.nvim",
		dependencies = {
			"natecraddock/telescope-zf-native.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-frecency.nvim",
			"nvim-telescope/telescope-project.nvim",
			"olacin/telescope-cc.nvim",
		},
		keys = {
			{ "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Find current buffer" },
			{ "<leader>fp", "<cmd>Telescope project<cr>", desc = "Find project" },
		},
		opts = {
			defaults = {
				mappings = {
					i = {
						["<esc>"] = actions.close,
					},
				},
			},
			extensions = {
				project = {
					base_dirs = {
						{ path = "~/repo", max_depth = 1 },
						{ path = "~/repo/work", max_depth = 2 },
						{ path = "~/repo/gis", max_depth = 3 },
					},
					hidden_files = true, -- default: false
					theme = "dropdown",
					order_by = "asc",
					search_by = "title",
					sync_with_nvim_tree = true, -- default false
					-- default for on_project_selected = find project files
					-- on_project_selected = function(prompt_bufnr)
					-- 	require("telescope._extensions.project.actions").change_working_directory(prompt_bufnr, false)
					-- 	require("harpoon.ui").nav_file(1)
					-- end,
				},
			},
		},
	},

	{
		"nvim-telescope/telescope-project.nvim",
		dependencies = { "nvim-telescope/telescope-file-browser.nvim" },
		config = function()
			require("telescope").load_extension("project")
		end,
	},

	-- {
	-- 	"cljoly/telescope-repo.nvim",
	-- 	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	-- 	config = function()
	-- 		require("telescope").load_extension("repo")
	-- 	end,
	-- 	keys = {
	-- 		{ "<leader>fp", "<cmd>Telescope repo list search_dirs=~/repo<cr>", desc = "Find projects" },
	-- 	},
	-- },

	{
		"tiagovla/scope.nvim",
		config = function()
			require("telescope").load_extension("scope")
		end,
	},

	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").load_extension("file_browser")
		end,
		keys = {
			{ "<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "File browser" },
			-- { "<leader>fe", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "File browser" },
		},
	},

	{
		"nvim-telescope/telescope-frecency.nvim",
		dependencies = { "kkharji/sqlite.lua" },
		config = function()
			require("telescope").load_extension("frecency")
		end,
		keys = {
			{ "<leader><leader>", "<cmd>Telescope frecency<cr>", desc = "Find frecency" },
		},
	},

	{
		"olacin/telescope-cc.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").load_extension("conventional_commits")
		end,
		keys = {
			{ "<leader>gm", "<cmd>Telescope conventional_commits<cr>", desc = "Conventional commit" },
		},
	},

	-- {
	--   "nvim-telescope/telescope.nvim",
	--   config = function() require("telescope").load_extension "scope" end,
	--   keys = {
	--     { "<leader>fs", "<cmd>Telescope scope buffer<cr>", { noremap = true, silent = true }, desc = "Scope" },
	--   },
	-- },
}
