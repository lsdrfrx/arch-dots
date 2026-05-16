local opt = vim.opt
local g = vim.g

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Base options
opt.compatible = false
opt.clipboard = "unnamedplus"
opt.number = true
opt.cursorline = true
opt.wrap = false
opt.history = 1000

-- Visual enhancement
opt.showcmd = true
opt.showmode = true
opt.scrolloff = 5
opt.termguicolors = true
opt.signcolumn = "yes"
opt.conceallevel = 3

-- Folds
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- Indent and tabs
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true

-- Search
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true

-- Files
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- Split settings
opt.splitbelow = true
opt.splitright = true

-- Other
vim.cmd("filetype on")
vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")
vim.cmd("syntax on")
vim.cmd("set textwidth=500")
vim.cmd("set fo+=t")

opt.laststatus = 3
opt.pumheight = 10
