return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
		  "nvim-lua/plenary.nvim",
		  "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		  "MunifTanjim/nui.nvim",
		},
		lazy = false,
		keys = {
			{ "<Leader>e", ":Neotree<CR>", desc = "Open Neotree" },
		},
		opts = {
			popup_border_style = "rounded", -- "double", "none", "rounded", "shadow", "single" or "solid"
			filesystem = {
				filtered_items = {
					hide_dotfiles = false
				}
			}
		},
	}
}
