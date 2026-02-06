-- lsp.lua
require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"ts_ls",
		"html",
		"cssls",
		"jsonls",
		"bashls",
	},
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Lua
vim.lsp.config("lua_ls", {
	capabilities = capabilities,
})

-- TypeScript / JavaScript
vim.lsp.config("ts_ls", {
	capabilities = capabilities,
})

-- Web
vim.lsp.config("html", {
	capabilities = capabilities,
})
vim.lsp.config("cssls", {
	capabilities = capabilities,
})


vim.lsp.config("jsonls", {
	capabilities = capabilities,
})


-- Bash
vim.lsp.config("bashls", {
	capabilities = capabilities,
})


vim.lsp.enable({
	"lua_ls",
	"ts_ls",
	"html",
	"cssls",
	"jsonls",
	"bashls",
})
