-- local utils = require "astronvim.utils"
-- local get_icon = utils.get_icon
-- local is_available = utils.is_available
-- local ui = require "astronvim.utils.ui"
--
return {
	n = {
		-- ["<leader>fa"] = {
		--   "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>",
		--   desc = "Find Files +hidden",
		-- },

		-- core
		["<leader>bn"] = { "]b", desc = "Next Buffer" },

		-- Tab Mappings
		-- a table with the `name` key will register with which-key if it's available
		-- this an easy way to add menu titles in which-key
		["<leader>T"] = { name = "Tab" },
		["<leader><tab>n"] = { "<cmd>tabnew<cr>", desc = "New tab" },
		["<leader><tab>c"] = { "<cmd>tabclose<cr>", desc = "Close tab" },

		-- Overseer
		["<leader>:"] = { name = "Overseer" },
		["<leader>::"] = { "<cmd>OverseerRun<cr>", desc = "OverseerRun" },
		["<leader>:c"] = { "<cmd>OverseerClose<cr>", desc = "OverseerClose" },
		["<leader>:o"] = { "<cmd>OverseerOpen<cr>", desc = "OverseerOpen" },
		["<leader>:t"] = { "<cmd>OverseerToggle<cr>", desc = "OverseerToggle" },
		["<leader>:i"] = { "<cmd>OverseerInfo<cr>", desc = "OverseerInfo" },
	},

	c = {
		["<C-p>"] = { "<Down>" },
		["<C-n>"] = { "<Up>" },
		["<C-j>"] = function()
			require("cmp").select_next_item()
		end,
		["<C-k>"] = function()
			require("cmp").select_prev_item()
		end,
	},
}
