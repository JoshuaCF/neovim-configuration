local servers = { "lua_ls", "clangd", "rust_analyzer", "asm_lsp" }
return {
	"neovim/nvim-lspconfig",
	branch = "master",
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		for _,v in pairs(servers) do
			require("lspconfig")[v].setup({ capabilities = capabilities })
		end
	end
}
