local fuzzy_file_search_substitute = function()
	-- Open telescope prompt for files and modify binds as follows:
	-- <CR> on a file should reveal it in Neotree before opening it
	-- <S-CR> should only reveal it in Neotree
	local reveal_file = function(path)
		require("neo-tree.command").execute({
			action = "focus",
			source = "filesystem",
			position = "left",
			reveal_file = path,
		})
	end

	require("telescope.builtin").find_files({
		attach_mappings = function(_, map)
			map({"i", "n"}, "<CR>", function(prompt_bufnr)
				local telescope_state = require("telescope.actions.state")
				local actions = require("telescope.actions")

				local entry = telescope_state.get_selected_entry()
				actions.close(prompt_bufnr)
				reveal_file(entry.cwd .. "/" .. entry[1])
				-- Jank, but seemingly necessary. After revealing the file, the Neotree state doesn't immediately
				-- update, and so even though the new state is fetched here, it won't work. Perhaps due to
				-- needing to load the filesystem or something like that?
				-- 50 milliseconds seemed to be a robust enough delay and is hardly noticeable
				vim.defer_fn(function()
					local nt_state = require("neo-tree.sources.manager").get_state("filesystem", nil, nil)
					nt_state.commands.open(nt_state)
				end, 50)
			end, { desc = "Edit and reveal in Neotree" })

			map({"i", "n"}, "<S-CR>", function(prompt_bufnr)
				local telescope_state = require("telescope.actions.state")
				local actions = require("telescope.actions")

				local entry = telescope_state.get_selected_entry()
				actions.close(prompt_bufnr)
				reveal_file(entry.cwd .. "/" .. entry[1])
			end, { desc = "Reveal in Neotree" })

			return true
		end,
	})
end

return {
 	{
 		"nvim-neo-tree/neo-tree.nvim",
 		branch = "v3.x",
 		dependencies = {
 		  "nvim-lua/plenary.nvim",
 		  "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
 		  "MunifTanjim/nui.nvim",
 		},
 		lazy = false,
 		keys = {
 			{ "<Leader>e", ":Neotree<CR>", desc = "Open Neotree" },
 		},
 		opts = {
 			popup_border_style = "rounded", -- "double", "none", "rounded", "shadow", "single" or "solid"
 			filesystem = {
 				filtered_items = {
 					hide_dotfiles = false
 				},
				window = {
					mappings = {
						-- Replaces default fuzzy file search because it's slow
						["/"] = { fuzzy_file_search_substitute, desc = "Telescope find files" },
					},
				},
 			}
 		},
 	}
}
