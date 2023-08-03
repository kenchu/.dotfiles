-- local utils = require "astronvim.utils"
-- local get_icon = utils.get_icon
-- local is_available = utils.is_available
-- local ui = require "astronvim.utils.ui"
--
return {
	n = {
		-- buffer
		["<S-h>"] = { "<cmd>bprevious<cr>", desc = "Previous Buffer" },
		["<S-l>"] = { "<cmd>bnext<cr>", desc = "Next Buffer" },
		["<leader>bn"] = { "]b", desc = "Next Buffer" },

		-- Tab Mappings
		-- a table with the `name` key will register with which-key if it's available
		-- this an easy way to add menu titles in which-key
		["<leader><tab>"] = { name = "Tab" },
		["<leader><tab>n"] = { "<cmd>tabnew<cr>", desc = "New tab" },
		["<leader><tab>c"] = { "<cmd>tabclose<cr>", desc = "Close tab" },

		-- UI
		["<leader>ur"] = {
			"<cmd>nohlsearch<bar>diffupdate<bar>normal! <C-L><cr>",
			desc = "Redraw / clear hlsearch / diff update",
		},

		-- Overseer
		["<leader>:"] = { name = "Overseer" },
		["<leader>::"] = { "<cmd>OverseerRun<cr>", desc = "OverseerRun" },
		["<leader>:c"] = { "<cmd>OverseerClearCache<cr>", desc = "OverseerClearCache" },
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

	t = {
		["<C-/>"] = { "<cmd>close<cr>", desc = "Close terminal" },
	},
}
