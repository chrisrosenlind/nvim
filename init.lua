vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Vs code theme
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.cmd.colorscheme('vscode')

-- Save on Leader + w
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save' })

-- Go to file tree with Leader + e
vim.keymap.set('n', '<leader>e', vim.cmd.Explore, { desc = 'File explorer' })

-- Prettier format
vim.keymap.set('n', '<leader>f', function()
  vim.cmd('silent !npx prettier --write %')
  vim.cmd('edit!')
end, { desc = 'Format with Prettier' })
