vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.number = true
vim.opt.relativenumber = true

vim.cmd("colorscheme habamax")

vim.keymap.set("n", "<Leader>tl", function()
	vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle relative line numbers" })

vim.keymap.set("n", "<Leader>x", ":bp|bd#<CR>",
	{ desc = "Close the current buffer and move previous buffer into window" }
)
vim.keymap.set("n", "<Leader>X", ":bp|bd!#<CR>",
	{ desc = "Force close the current buffer and move previous buffer into window" }
)

local file_au_group = vim.api.nvim_create_augroup("init.lua", { clear = true })

function remove_eob_fills(args)
	vim.cmd("setlocal fillchars=eob:\\ ")
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "neo-tree",
	group = file_au_group,
	callback = remove_eob_fills,
})
vim.api.nvim_create_autocmd("BufWinEnter", {
	group = file_au_group,
	callback = function(args)
		if vim.bo[args.buf].filetype == "neo-tree" then
			remove_eob_fills(args)
		end
	end,
})
