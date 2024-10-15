return {
	{
		"nvim-treesitter/nvim-treesitter", opts = {
			ensure_installed = { "rust", "lua", "c", "cpp" },
			highlight = { enable = true },
			incremental_selection = { enable = true },
		},
		main = "nvim-treesitter.configs",
		build = ":TSUpdate",
	}
}
