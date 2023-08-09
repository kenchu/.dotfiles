return {
	"Exafunction/codeium.vim",
	lazy = false,
	cmd = "Codeium",
	init = function()
		-- vim.g.codeium_enabled = 1
		-- vim.g.codeium_disable_bindings = 1
		vim.g.codeium_idle_delay = 500
		-- match function
	end,
	config = function()
		vim.keymap.set("i", "<A-CR>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true })
		vim.keymap.set("i", "<A-j>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true })
		vim.keymap.set("i", "<A-k>", function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true })
		vim.keymap.set("i", "<A-BS>", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true })
		vim.api.nvim_set_hl(0, "CodeiumSuggestion", { link = "Comment" })
	end,
}
