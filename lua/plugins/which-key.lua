return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			spec = {
				{ "<Leader>l", group = "LSP Actions", desc = "LSP Actions" }
			}
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer local keymaps",
			},
		},
	}
}
