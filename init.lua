-- init.lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("anorak.core")

vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
        vim.cmd("Lazy")
    end,
})
