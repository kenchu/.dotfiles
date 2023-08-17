return {
	-- Add the community repository of plugin specifications
	"AstroNvim/astrocommunity",
	-- example of imporing a plugin, comment out to use it or add your own
	-- available plugins can be found at https://github.com/AstroNvim/astrocommunity

	{ import = "astrocommunity.colorscheme.catppuccin" },
	{
		"catppuccin",
		opts = {
			integrations = {
				telescope = {
					enabled = true,
					style = "nvchad",
				},
				indent_blankline = {
					enabled = true,
					colored_indent_levels = true,
				},
				lsp_trouble = true,
				flash = false,
			},
		},
	},
	{ import = "astrocommunity.colorscheme.dracula-nvim", enabled = false },
	{ import = "astrocommunity.colorscheme.tokyonight-nvim", enabled = true },
	-- { import = "astrocommunity.bars-and-lines.bufferline-nvim" },
	{ import = "astrocommunity.bars-and-lines.dropbar-nvim" },
	{ import = "astrocommunity.bars-and-lines.heirline-mode-text-statusline" },
	{ import = "astrocommunity.bars-and-lines.scope-nvim" },
	{ import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
	{
		"m4xshen/smartcolumn.nvim",
		opts = {
			colorcolumn = "120",
			disabled_filetypes = {
				"NeogitLogView",
				"NeogitGitCommandHistory",
				"Trouble",
				"alpha",
				"help",
				"lazy",
				"lspinfo",
				"markdown",
				"mason",
				"neo-tree",
				"text",
			},
			scope = "window",
		},
	},
	{ import = "astrocommunity.bars-and-lines.vim-illuminate" },

	{ import = "astrocommunity.code-runner.compiler-nvim" },
	{ import = "astrocommunity.code-runner.overseer-nvim" },
	{ import = "astrocommunity.code-runner.sniprun" },

	{ import = "astrocommunity.color.ccc-nvim" },
	{ import = "astrocommunity.color.headlines-nvim" },
	{ import = "astrocommunity.color.modes-nvim", enabled = true },
	{ import = "astrocommunity.color.twilight-nvim" },

	{ import = "astrocommunity.completion.cmp-cmdline" },
	-- { import = "astrocommunity.completion.codeium-vim" },
	{ import = "astrocommunity.debugging.nvim-bqf" },
	{ import = "astrocommunity.debugging.nvim-dap-virtual-text" },
	{ import = "astrocommunity.debugging.telescope-dap-nvim" },

	{ import = "astrocommunity.diagnostics.trouble-nvim" },

	{ import = "astrocommunity.editing-support.hypersonic-nvim" },
	{ import = "astrocommunity.editing-support.multicursors-nvim" },
	{ import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
	{ import = "astrocommunity.editing-support.nvim-regexplainer" },
	{ import = "astrocommunity.editing-support.suda-vim" },
	{ import = "astrocommunity.editing-support.telescope-undo-nvim" },
	{ import = "astrocommunity.editing-support.suda-vim" },
	{ import = "astrocommunity.editing-support.text-case-nvim" },
	{ import = "astrocommunity.editing-support.yanky-nvim" },
	{ import = "astrocommunity.file-explorer.mini-files", enabled = false },
	{ import = "astrocommunity.fuzzy-finder.telescope-zoxide" },

	{ import = "astrocommunity.git.diffview-nvim" },
	{ import = "astrocommunity.git.git-blame-nvim" },
	{ import = "astrocommunity.git.neogit" },

	{ import = "astrocommunity.indent.indent-blankline-nvim" },
	{ import = "astrocommunity.indent.indent-tools-nvim" },
	{ import = "astrocommunity.indent.mini-indentscope" },

	{ import = "astrocommunity.motion.flash-nvim" },
	{ import = "astrocommunity.motion.marks-nvim" },
	{ import = "astrocommunity.motion.mini-ai" },
	{ import = "astrocommunity.motion.mini-basics" },
	{ import = "astrocommunity.motion.mini-move" },
	{ import = "astrocommunity.motion.mini-surround" },
	{ import = "astrocommunity.motion.nvim-spider" },

	{ import = "astrocommunity.note-taking.neorg" },

	{ import = "astrocommunity.project.nvim-spectre" },
	-- { import = "astrocommunity.project.project-nvim" },
	{ import = "astrocommunity.project.projectmgr-nvim" },

	{ import = "astrocommunity.scrolling.satellite-nvim" },
	{ import = "astrocommunity.split-and-window.edgy-nvim" },
	{ import = "astrocommunity.syntax.vim-easy-align" },

	{ import = "astrocommunity.test.neotest" },
	{ import = "astrocommunity.test.nvim-coverage" },

	{ import = "astrocommunity.utility.neodim" },
	{ import = "astrocommunity.utility.noice-nvim" },
	{
		"folke/noice.nvim",
		cond = {}, -- remove astronvim conditional check
		opts = {
			presets = {
				bottom_search = false,
				inc_rename = true,
				lsp_doc_border = true,
			},
		},
	},
	{ import = "astrocommunity.utility.nvim-toggler" },
	{ import = "astrocommunity.utility.transparent-nvim" },

	{ import = "astrocommunity.pack.ansible" },
	{ import = "astrocommunity.pack.docker" },
	{ import = "astrocommunity.pack.go" },
	{ import = "astrocommunity.pack.html-css" },
	{ import = "astrocommunity.pack.java" },
	{ import = "astrocommunity.pack.json" },
	{ import = "astrocommunity.pack.kotlin" },
	{ import = "astrocommunity.pack.lua" },
	{ import = "astrocommunity.pack.proto" },
	{ import = "astrocommunity.pack.python" },
	{ import = "astrocommunity.pack.rust" },
	{ import = "astrocommunity.pack.svelte" },
	{ import = "astrocommunity.pack.toml" },
	{ import = "astrocommunity.pack.yaml" },

	{ import = "astrocommunity.programming-language-support.nvim-jqx" },
	{ import = "astrocommunity.programming-language-support.rest-nvim" },
	{ import = "astrocommunity.programming-language-support.web-tools-nvim" },
}
