-- core.lua
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("anorak.plugins")
require("anorak.lsp")
require("anorak.cmp")
