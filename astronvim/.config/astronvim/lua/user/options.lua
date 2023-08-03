return {
	g = {
		heirline_bufferline = true,
		winblend = vim.g.neovide and 30 or 0,
		inlayhints = true,
	},
	o = {
		guifont = "JetBrainsMono Nerd Font:h12.5",
		autoread = true,
		winwidth = 10,
		winminwidth = 10,
		equalalways = true,
		pumblend = vim.g.winblend,
	},
	opts = {},
}
