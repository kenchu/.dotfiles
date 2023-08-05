return {
	{
		"echasnovski/mini.surround",
		keys = {
			{ "sa", desc = "Add Surrounding" },
			{ "sd", desc = "Delete Surrounding" },
			{ "sf", desc = "Find Surrounding Right" },
			{ "sF", desc = "Find Surrounding Left" },
			{ "sh", desc = "Highlight Surrounding" },
			{ "sr", desc = "Replace Surrounding" },
			{ "sn", desc = "Update N Lines" },
		},
		opts = {
			highlight_duration = 1000,

			-- Module mappings. Use `''` (empty string) to disable one.
			mappings = {
				add = "sa", -- Add surrounding in Normal and Visual modes
				delete = "sd", -- Delete surrounding
				find = "sf", -- Find surrounding (to the right)
				find_left = "sF", -- Find surrounding (to the left)
				highlight = "sh", -- Highlight surrounding
				replace = "sr", -- Replace surrounding
				update_n_lines = "sn", -- Update `n_lines`

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},
		},
	},
}
