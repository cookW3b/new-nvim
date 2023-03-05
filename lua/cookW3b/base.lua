vim.api.nvim_command('set number')
vim.api.nvim_command('set cmdheight=0')
-- vim.api.nvim_command('set spell spelllang=en_us')
-- vim.api.nvim_command('set spellsuggest=best,9')
vim.api.nvim_command('set shellcmdflag=-c')
-- vim.api.nvim_command('set shell="C:/Program Files/Git/bin/bash.exe"')

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false

-- Autoremove trailing spaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
