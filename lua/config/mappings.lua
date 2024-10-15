vim.keymap.set("n", "<Leader>tl", function()
	vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle relative line numbers" })

vim.keymap.set("n", "<Leader>x", ":bp|bd#<CR>",
	{ desc = "Close the current buffer and move previous buffer into window" }
)
vim.keymap.set("n", "<Leader>X", ":bp|bd!#<CR>",
	{ desc = "Force close the current buffer and move previous buffer into window" }
)

vim.keymap.set("n", "<ESC>", ":noh<CR>", { desc = "Remove search highlights" })

-- LSP Bindings are in autocommands.lua
