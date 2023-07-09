return {

	{
		"charludo/projectmgr.nvim",
		lazy = false,
		keys = {
			{ "<leader>fP", "<cmd>ProjectMgr<cr>", desc = "Open ProjectMgr panel" },
		},
	},

	{
		"telescope.nvim",
		keys = {
			{ "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Find current buffer" },
		},
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
		"cljoly/telescope-repo.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").load_extension("repo")
		end,
		keys = {
			{ "<leader>fp", "<cmd>Telescope repo list search_dirs=~/repo<cr>", desc = "Find projects" },
		},
	},

	{
		"tiagovla/scope.nvim",
		config = function()
			require("telescope").load_extension("scope")
		end,
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
