vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })

-- Switch between C++ source and header
vim.keymap.set("n", "<leader>o", function()
	local filetype = vim.bo.filetype
	local isCppFile = filetype == "cpp" or filetype == "h"

	if not isCppFile then
		vim.notify("Not a C++ file. Can't switch between source and header", vim.log.levels.WARN)
		return
	end


	local clients = vim.lsp.get_clients({ bufnr = 0 })
	local isClangdAttached = #clients > 0

	if not isClangdAttached then
		vim.notify("No LSP client attached", vim.log.levels.WARN)
		return
	end


	local params = { uri = vim.uri_from_bufnr(0) }
	vim.lsp.buf_request(0, "textDocument/switchSourceHeader", params, function(err, result)
		if err then
			vim.notify("Switch failed: " .. err.message, vim.log.levels.ERROR)
		elseif not result then
			vim.notify("No corresponding source/header found", vim.log.levels.WARN)
		else
			vim.cmd("edit " .. vim.uri_to_fname(result))
		end
	end)
end, { desc = "Switch between header/source" })

