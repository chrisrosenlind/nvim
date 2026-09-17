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
  -- Lsp
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  },
  -- Auto close brackets
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
  },
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
    "nvim-telescope/telescope.nvim", version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    }
  }
})

-- Lsp
local cmp = require("cmp")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("ts_ls", {
  capabilities = capabilities,
})

vim.lsp.enable("ts_ls")

cmp.setup({
  sources = {
    { name = "nvim_lsp" },
  },
})

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "ts_ls",
  },
})

vim.lsp.config("ts_ls", {})
vim.lsp.enable("ts_ls")

-- Telescope: Ignore folders 
require('telescope').setup{ 
  defaults = { 
    file_ignore_patterns = { 
      "node_modules/", 
      ".dist/"
    }
  }
}

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

-- Telescope grep
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep)

-- Go to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
  desc = "Go to definition",
})

-- Find references
vim.keymap.set("n", "gr", vim.lsp.buf.references, {
  desc = "Find references",
})

-- Documentation
vim.keymap.set("n", "K", vim.lsp.buf.hover, {
  desc = "Hover documentation",
})

-- Rename
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
  desc = "Rename",
})

-- Code action
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
  desc = "Code action",
})
