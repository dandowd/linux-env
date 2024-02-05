require("neotest").setup({
	adapters = {
		require("neotest-go"),
	},
	output = {
		enable = false,
		open_on_run = false,
	},
	quickfix = {
		enable = false,
		open = false,
	},
	output_panel = {
		enable = false,
		open = false,
	},
})
