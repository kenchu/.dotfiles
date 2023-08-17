return {

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"natecraddock/telescope-zf-native.nvim",
			{
				"nvim-telescope/telescope-frecency.nvim",
				dependencies = { "kkharji/sqlite.lua" },
			},
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-media-files.nvim",
			"nvim-telescope/telescope-project.nvim",
			"tiagovla/scope.nvim",
			"olacin/telescope-cc.nvim",
		},
		config = function(plugin, opts)
			-- run the core AstroNvim configuration function with the options table
			require("plugins.configs.telescope")(plugin, opts)

			-- require telescope and load extensions as necessary
			local telescope = require("telescope")
			telescope.load_extension("media_files")
			telescope.load_extension("conventional_commits")
			telescope.load_extension("file_browser")
			telescope.load_extension("frecency")
			telescope.load_extension("media_files")
			telescope.load_extension("project")
			telescope.load_extension("scope")
		end,
		keys = {
			{ "<leader><space>", "<cmd>Telescope frecency workspace=CWD<cr>", desc = "Find frecency" },
			{ "<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "File browser" },
			-- { "<leader>fe", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "File browser" },
			{ "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find git files" },
			{ "<leader>fp", "<cmd>Telescope project<cr>", desc = "Find projects" },
			{ "<leader>fs", "<cmd>Telescope scope buffers<cr>", desc = "Find scope buffers" },
			{ "<leader>fM", "<cmd>Telescope media_files<cr>", desc = "Find media files" },
			{ "<leader>gm", "<cmd>Telescope conventional_commits<cr>", desc = "Conventional commit" },
		},
		opts = {
			defaults = {
				-- prompt_prefix = "󰭎 ",
				mappings = {
					i = {
						["<esc>"] = require("telescope.actions").close,
						["<A-p>"] = require("telescope.actions.layout").toggle_preview,
					},
					n = {
						["<A-p>"] = require("telescope.actions.layout").toggle_preview,
					},
				},
			},
			extensions = {
				media_files = {
					-- filetypes = { "png", "webp", "gif", "jpg", "jpeg", "mp4", "webm", "pdf" },
					find_cmd = "rg",
				},
				project = {
					base_dirs = {
						{ path = "~/repo", max_depth = 1 },
						{ path = "~/repo/work", max_depth = 2 },
						{ path = "~/ghq", max_depth = 3 },
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
}
