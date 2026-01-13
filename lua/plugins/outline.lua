return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = {
		{ "<leader>O", "<cmd>Outline!<CR>", desc = "Toggle outline window" },
		{ "<leader>o",
			function()
				local outline = require("outline")
				if outline.is_open() then
					outline.focus_toggle()
				else
					outline.open_outline({ focus_outline = true })
				end
			end,
			desc = "Toggle outline focus",
		},
	},
	opts = {},
}
