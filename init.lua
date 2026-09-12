-- Lazy.nvim
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
  -- VS Code theme
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.termguicolors = true
      vim.o.background = "dark"
      vim.cmd.colorscheme("vscode")
      end,
  },
  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
  },
  {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    }
  }
})

-- General settings
vim.opt.number = true
vim.opt.relativenumber = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Save with Leader + w
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", {
  desc = "Save",
})

-- File explorer with Leader + e
vim.keymap.set("n", "<leader>e", vim.cmd.Explore, {
  desc = "File explorer",
})

-- Prettier format with Leader + f
vim.keymap.set("n", "<leader>f", function()
  vim.cmd("silent !npx prettier --write %")
  vim.cmd("edit!")
  end, {
    desc = "Format with Prettier",
})

-- Toggle telescope
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>", {
  desc = "Find files",
})
