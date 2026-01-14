return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
        		globalstatus = true,
				refresh = {
					statusline = 50, -- For mode updates, I don't know the event for it (if there is one)
				}
			},
			sections = {
				lualine_c = {
					"filename", -- TODO: make this display the entire filepath relative to neo-tree root dir
					{
						require("noice").api.status.command.get_hl,
						cond = require("noice").api.status.command.has,
					},
				},
				lualine_x = {
					{
						require("noice").api.status.mode.get_hl,
						cond = require("noice").api.status.mode.has,
					},
					'encoding',
					'fileformat',
					'filetype',
				}
			}
		},
	}
}
