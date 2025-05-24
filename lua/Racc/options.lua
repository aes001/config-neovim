vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
vim.opt["tabstop"] = 4
vim.opt["shiftwidth"] = 4
vim.diagnostic.config({
  virtual_text = true,  -- show messages inline
  signs = true,         -- show E/W/etc in the sign column
  underline = true,     -- underline the problematic code
  update_in_insert = false,
  severity_sort = true,
})
