local servers = { "lua_ls" }
return {
	"neovim/nvim-lspconfig",
	branch = "master",
	config = function()
		for _,v in pairs(servers) do
			require("lspconfig")[v].setup({})
		end
	end
}
