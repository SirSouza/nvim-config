 -- cmp.lua
 local cmp = require("cmp")

 cmp.setup({
	 completion = {
		 autocomplete = { cmp.TriggerEvent.TextChanged },
		 completeopt = "menu,menuone,noinsert",
	 },

	 mapping = cmp.mapping.preset.insert({
		 ["<C-Space>"] = cmp.mapping.complete(),
		 ["<CR>"] = cmp.mapping.confirm({ select = true }),
		 ["<ESC>"] = cmp.mapping.abort(),
	 }),

	 sources = cmp.config.sources({
		{
			name = "nvim_lsp",
			keyword_length = 1,
		},
		{
			name = "buffer",
			keyword_length = 2,
		},
		{
			name = "path",
		},
	 }),
 })
