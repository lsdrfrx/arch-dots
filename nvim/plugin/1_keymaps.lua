vim.keymap.set("n", "<ESC>", ":noh<CR><ESC>", { silent = true })
vim.keymap.set("i", "<C-BS>", "<C-w>", { silent = true })

vim.cmd([[
noremap j h
noremap k j
noremap l k
noremap ; l

tnoremap <Esc><Esc> <C-\><C-n>
]])

vim.keymap.set("n", "<A-j>", ":wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<A-k>", ":wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<A-l>", ":wincmd k<CR>", { silent = true })
vim.keymap.set("n", "<A-;>", ":wincmd l<CR>", { silent = true })

vim.keymap.set("n", "<A-left>", ":wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<A-down>", ":wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<A-up>", ":wincmd k<CR>", { silent = true })
vim.keymap.set("n", "<A-right>", ":wincmd l<CR>", { silent = true })
