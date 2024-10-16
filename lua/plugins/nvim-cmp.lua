return {
	{
		"hrsh7th/nvim-cmp", branch = "main",
		opts = {
			sources = {
				{ name = "nvim_lsp" },
				{ name = "path" } -- Not working as well as I want
			}
		},
		event = "BufEnter",
		keys = {
			{ "<Tab>",
				function()
					local cmp = require("cmp")
					if cmp.visible() then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
					else
						return "<Tab>"
					end
				end, mode = "i", desc = "Select next completion"
			},
			{ "<S-Tab>",
				function()
					local cmp = require("cmp")
					if cmp.visible() then
						cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
					else
						return "<S-Tab>"
					end
				end, mode = "i", desc = "Select prev completion"
			},
			{ "<S-CR>",
				function()
					local cmp = require("cmp")
					if cmp.visible() then
						cmp.confirm()
					else
						return "<S-CR>"
					end
				end, mode = "i", desc = "Confirm completion"
			},
			{ "<C-CR>",
				function()
					local cmp = require("cmp")
					cmp.complete()
				end, mode = "i", desc = "Open completion"
			},
		}
	}
}
