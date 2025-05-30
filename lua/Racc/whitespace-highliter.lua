local M = {}

local function defineHighlights()
	vim.cmd([[highlight ExtraWhitespace ctermbg=DarkRed guibg=#470506]])
	vim.cmd([[highlight MixedWhitespace ctermbg=DarkRed guibg=#470506]])
end
function M.setup()
	defineHighlights()

	vim.api.nvim_create_autocmd("ColorScheme", {
		pattern = "*",
		callback = defineHighlights,
	})

	-- Apply highlights on buffer open
	vim.api.nvim_create_autocmd("BufWinEnter", {
		pattern = "*",
		callback = function()
			vim.fn.matchadd("ExtraWhitespace", [[\s\+$]])
			-- vim.fn.matchadd("MixedWhitespace", [[\v(\t +| +\t)]]) -- no mixed white space at all
			vim.fn.matchadd("MixedWhitespace", [[\v( +\t)]]) -- Review board style
		end,
	 })
end

return M

