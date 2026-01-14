return {
	{
		"folke/noice.nvim",
		lazy = false,
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = {
			cmdline = {
				view = "cmdline",
				format = {
					help = false,
				}
			},
		},
	}
}
