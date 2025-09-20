local opt = vim.opt

opt.background = "light"
vim.cmd("colorscheme zenbones")

vim.cmd("highlight Folded guibg=NONE")
vim.cmd("highlight FoldColumn ctermfg=NONE guifg=NONE")

vim.cmd("highlight DiagnosticVirtualTextWarn guibg=NONE ctermbg=NONE")
vim.cmd("highlight DiagnosticVirtualTextError guibg=NONE ctermbg=NONE")
vim.cmd("highlight DiagnosticVirtualTextInfo guibg=NONE ctermbg=NONE")
vim.cmd("highlight DiagnosticVirtualTextHint guibg=NONE ctermbg=NONE")
vim.cmd("highlight DiagnosticVirtualTextOk guibg=NONE ctermbg=NONE")

vim.cmd("hi WinSeparator guifg=bg")
vim.cmd("hi NormalNC guibg=bg")
vim.cmd("hi NormalFloat guibg=bg")
vim.cmd("hi FloatTitle guibg=bg")

vim.cmd("hi TroubleNormal guibg=bg")
vim.cmd("hi TroubleNormalNC guibg=bg")

vim.cmd("hi NoiceCmdlinePopupBorder guifg=fg")
