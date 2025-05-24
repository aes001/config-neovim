vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
vim.opt["tabstop"] = 4
vim.opt["shiftwidth"] = 4
vim.api.nvim_create_autocmd("BufWinEnter", {
	callback = function()
		vim.wo.signcolumn = "yes:1"
	end,
})
vim.diagnostic.config({
  virtual_text = true,  -- show messages inline
  signs = true,         -- show E/W/etc in the sign column
  underline = true,     -- underline the problematic code
  update_in_insert = false,
  severity_sort = true,
})
