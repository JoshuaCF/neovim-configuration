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
