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
					vim.print("Tab pressed")
					local cmp = require("cmp")
					if cmp.visible() then
						vim.print("Moving cmp selection")
						return "<Cmd>lua require('cmp').select_next_item({ behavior = require('cmp').SelectBehavior.Select })<CR>"
					else
						vim.print("Just typing tab")
						return "<Tab>"
					end
				end, mode = "i", desc = "Select next completion", expr = true
			},
			{ "<S-Tab>",
				function()
					local cmp = require("cmp")
					if cmp.visible() then
						return "<Cmd>lua require('cmp').select_prev_item({ behavior = require('cmp').SelectBehavior.Select })<CR>"
					else
						return "<S-Tab>"
					end
				end, mode = "i", desc = "Select prev completion", expr = true
			},
			{ "<S-CR>",
				function()
					local cmp = require("cmp")
					if cmp.visible() then
						return "<Cmd>lua require('cmp').confirm()<CR>"
					else
						return "<S-CR>"
					end
				end, mode = "i", desc = "Confirm completion", expr = true
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
