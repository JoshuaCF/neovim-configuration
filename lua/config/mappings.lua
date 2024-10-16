-- LSP Bindings are in autocommands.lua

-- Misc mappings
vim.keymap.set("n", "<Leader>tl", function()
	vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle relative line numbers" })
vim.keymap.set("n", "<Esc>", ":noh<CR>", { desc = "Remove search highlights" })

-- Buffer navigation mappings
vim.keymap.set("n", "<Leader>x", ":bp|bd#<CR>",
	{ desc = "Close buffer" }
)
vim.keymap.set("n", "<Leader>X", ":bp|bd!#<CR>",
	{ desc = "Force close buffer" }
)

-- Surround mappings
vim.keymap.set("v", "<Leader>(", "<Esc>`>a)<Esc>`<lt>i(<Esc>",
	{ desc = "Surround selection with parentheses" }
)
vim.keymap.set("v", "<Leader>[", "<Esc>`>a]<Esc>`<lt>i[<Esc>",
	{ desc = "Surround selection with square brackets" }
)
vim.keymap.set("v", "<Leader>{", "<Esc>`>a}<Esc>`<lt>i{<Esc>",
	{ desc = "Surround selection with curly brackets" }
)
vim.keymap.set("v", "<Leader>'", "<Esc>`>a'<Esc>`<lt>i'<Esc>",
	{ desc = "Surround selection with single quotes" }
)
vim.keymap.set("v", "<Leader>\"", "<Esc>`>a\"<Esc>`<lt>i\"<Esc>",
	{ desc = "Surround selection with double quotes" }
)

-- Paired insert mappings
vim.keymap.set("n", "<Leader>(", "i()<Esc>i",
	{ desc = "Insert paired parentheses" }
)
vim.keymap.set("n", "<Leader>[", "i[]<Esc>i",
	{ desc = "Insert paired square brackets" }
)
vim.keymap.set("n", "<Leader>{", "i{}<Esc>i",
	{ desc = "Insert paired curly brackets" }
)
vim.keymap.set("n", "<Leader>'", "i''<Esc>i",
	{ desc = "Insert paired single quotes" }
)
vim.keymap.set("n", "<Leader>\"", "i\"\"<Esc>i",
	{ desc = "Insert paired double quotes" }
)
