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

				local on_attach = function(_, bufnr)
					local opts = { noremap = true, silent = true }

					vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
					vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
				    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) -- Hover docs
					vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts) -- References
				end

				for _, lsp in ipairs(servers) do
					lspconfig[lsp].setup({
						capabilities = capabilities,
						on_attach = on_attach,
					})
				end
			end,
		},
	},
}
