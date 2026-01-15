-- Misc mappings
vim.keymap.set("n", "<Leader>r", function()
	vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle relative line numbers" })
vim.keymap.set("n", "<Esc>", ":noh<CR>", { desc = "Remove search highlights" })

-- Helper function to force close the current buffer/window gracefully
local close_current = function()
	local prev_buf = vim.api.nvim_get_current_buf()
	-- Try to go to the next buffer as a predictable way of knowing what will be
	-- displayed if this bind is executed
	vim.cmd("BufferLineCycleNext")
	local cur_buf = vim.api.nvim_get_current_buf()

	if cur_buf == prev_buf then
		-- If we don't move, vim won't like us deleting the last visible buffer
		-- because the window will have nothing to display
		local other_window_available = false
		local windows_displaying_buf = {}
		for _, v in pairs(vim.api.nvim_list_wins()) do
			if vim.api.nvim_win_get_buf(v) == cur_buf then
				table.insert(windows_displaying_buf, v)
			else
				other_window_available = true
			end
		end

		if other_window_available then
			-- If there is another window, then we can close all windows displaying the buffer
			for _,v in pairs(windows_displaying_buf) do
				vim.api.nvim_win_close(v, true)
			end
			vim.api.nvim_buf_delete(prev_buf, { unload = true, force = true })
			vim.bo[prev_buf].buflisted = false
		else
			-- If all windows display the current buffer, then just exit nvim
			vim.cmd("qa!")
		end
	else
		-- If we moved, then we can just unload and unlist the old buffer
		vim.api.nvim_buf_delete(prev_buf, { unload = true, force = true })
		vim.bo[prev_buf].buflisted = false
	end
end

-- Buffer navigation mappings
vim.keymap.set("n", "<Leader>x",
	function()
		if vim.bo.modified then
			vim.api.nvim_echo({{"Unable to close buffer, buffer has been modified", "WarningMsg"}}, false, {})
			return
		end
		close_current()
	end,
	{ desc = "Close buffer" }
)
vim.keymap.set("n", "<Leader>X", function()
		close_current()
	end,
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
