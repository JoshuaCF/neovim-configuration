local file_au_group = vim.api.nvim_create_augroup("autocommands.lua", { clear = true })

local function remove_eob_fills()
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
			remove_eob_fills()
		end
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = file_au_group,
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client.server_capabilities.definitionProvider then
			vim.keymap.set("n", "<Leader>ld", vim.lsp.buf.definition, { buffer = bufnr, desc = "Goto definition" })
		end
		if client.server_capabilities.hoverProvider then
			vim.keymap.set("n", "<Leader>lh", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover popup" })
		end
		if client.server_capabilities.codeActionProvider then
			vim.keymap.set("n", "<Leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Perform code action" })
		end
		if client.server_capabilities.renameProvider then
			vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
		end
	end,
})
