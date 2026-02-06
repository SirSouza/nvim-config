 -- init.lua
 require("anorak.core")

 vim.api.nvim_create_autocmd("VimEnter", {
   callback = function ()
     if vim.fn.argc() == 0 then 
       vim.cmd("cd /mnt/C3PO/Shared/Curso/")
       vim.cmd("Neotree filesystem reveal left")
     end
   end,
 })
