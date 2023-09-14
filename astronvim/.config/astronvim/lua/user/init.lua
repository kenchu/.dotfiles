-- https://astronvim.com/Configuration/config_options
return {
	-- https://github.com/folke/lazy.nvim
	lazy = {
		concurrency = 64,
		change_detection = {
			enabled = true,
			notify = true,
		},
	},
}
