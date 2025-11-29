local opt = vim.opt

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
-- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep:|,foldclose:]]
-- vim.o.foldcolumn = 'auto:9'
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

-- vim.cmd("hi WinBar guibg=bg")
-- vim.cmd("hi WinBarNC guibg=bg")
-- vim.cmd("hi TerminalNormal guibg=bg")
-- vim.cmd("hi TerminalBorder guibg=bg")
-- vim.cmd("hi NeoTreeIndentMarker guifg=bg")
-- vim.cmd("hi SignColumn guibg=bg")
-- vim.cmd("hi StatusLine guibg=bg")

vim.diagnostic.config({
	signs = false,
	float = {
		style = "minimal",
		focusable = false,
		header = "",
		prefix = "",
	},
	virtual_text = {
		source = "if_many",
		prefix = " ",
	},
	update_in_insert = true,
	severity_sort = true,
})

opt.laststatus = 3
opt.pumheight = 10
