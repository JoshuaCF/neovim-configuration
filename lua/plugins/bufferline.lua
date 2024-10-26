return {
	{
		"akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons",
		init = function()
			vim.opt.termguicolors = true
		end,
		lazy = false,
		keys = {
			{ "<Tab>", ":BufferLineCycleNext<CR>", desc = "Switch to next buffer" },
			{ "<S-Tab>", ":BufferLineCyclePrev<CR>", desc = "Switch to prev buffer" },
		},
		opts = {
			options = {
				offsets = {
					{ filetype = "neo-tree" },
				},
			},
		},
	},
}
