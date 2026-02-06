-- plugins.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)


require("lazy").setup({

	--catppuccin theme configuration
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 100,
	},


	-- Material theme configuration
	{
		"marko-cerovac/material.nvim",
		name = "material",
		priority = 100,
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto",
					section_separators = "",
					component_separators = "",
				},
			})
		end,

	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"javascript",
				"html",
				"css",
				"json",
				"bash",
				"markdown",
			},
			highlight = { enable = true },
			indent = { enable = true },
		},
	},

	-- LSP base
	{
		"neovim/nvim-lspconfig",
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
	},
	{
		"williamboman/mason-lspconfig.nvim"
	},

	-- autocomplete (no snippets)
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	-- Neotree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				filesystem = {
					follow_current_file = {
						enabled = true,
					},
					hijack_netrw_behavior = "open_default",
				},
				window = {
					position = "left",
					width = 30,
				},
			})
		end,
	},
})
