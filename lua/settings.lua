vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.scrolloff = 4

vim.opt.incsearch = true

vim.diagnostic.enable()
vim.diagnostic.config({virtual_text = true, signs = true, underline = true})
vim.keymap.set("n", "gl", vim.diagnostic.open_float)
