return {
    {
		"nvim-telescope/telescope.nvim", tag = "v0.2.1",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons"
		},
		opts = {
			defaults = {
				borderchars = {" ", " ", " ", " ", " ", " ", " ", " "}, -- I like an opaque border but not that horrible border shape
			}
		},
		cmd = {
			"Telescope",
		},
		keys = {
			{ "<Leader>tf", "<Cmd>Telescope find_files<CR>", "n", { desc = "Telescope filenames" }},
			{ "<Leader>tg", "<Cmd>Telescope live_grep<CR>", "n", { desc = "Telescope live grep" }},
			{ "<Leader>th", "<Cmd>Telescope help_tags<CR>", "n", { desc = "Telescope help tags" }},
		}
    }
}
