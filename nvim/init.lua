vim.g.mapleader = " "
vim.g.maplocalleader = ","

if vim.g.neovide then
	vim.cmd([[ set guifont=MesloLGMDZ\ Nerd\ Font\ Mono:h12 ]])
	vim.g.neovide_input_macos_option_key_is_meta = "only_left"
	vim.g.neovide_floating_shadow = false
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

require("lazy").setup("plugins")

require("core.options")
require("core.autocommands")
require("core.keymaps")
require("core.highlights")
