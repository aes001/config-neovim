local servers = { "clangd", "lua_ls", "cmake", "pyright", "bashls" }

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"williamboman/mason-lspconfig.nvim",
			config = function()
				require("mason-lspconfig").setup({
					ensure_installed = servers,
				})

				local lspconfig = require("lspconfig")
				local capabilities = require("cmp_nvim_lsp").default_capabilities()

				for _, lsp in ipairs(servers) do
					lspconfig[lsp].setup({
						capabilities = capabilities,
					})
				end
			end,
		},
	},
}
