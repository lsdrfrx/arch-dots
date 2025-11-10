local map = vim.keymap.set

map("n", "-", "<cmd>Oil --float<CR>", { silent = true })
map("n", "<ESC>", ":noh<CR><ESC>", { silent = true })
map("i", "<C-BS>", "<C-w>", { silent = true })

-- Telescope keymaps
map("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true })
map("n", "<leader>fb", ":Telescope buffers<CR>", { silent = true })
map("n", "<leader>fm", ":Telescope marks<CR>", { silent = true })
map("n", "<leader>fp", ":Telescope projects<CR>", { silent = true })
map("n", "<A-d>", ":Telescope coc definitions<CR>", { silent = true })
map("n", "<A-r>", ":Telescope coc references<CR>", { silent = true })

vim.cmd([[
noremap j h
noremap k j
noremap l k
noremap ; l

inoremap <expr> <TAB> coc#pum#visible() ? coc#pum#select_confirm() : "\<TAB>"
inoremap <silent><expr> <c-space> coc#refresh()

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
]])

map("n", "<leader>u", ":UndotreeToggle<CR>", { silent = true })

-- Move between panes
map("n", "<A-j>", ":wincmd h<CR>", { silent = true })
map("n", "<A-k>", ":wincmd j<CR>", { silent = true })
map("n", "<A-l>", ":wincmd k<CR>", { silent = true })
map("n", "<A-;>", ":wincmd l<CR>", { silent = true })

map("n", "<A-left>", ":wincmd h<CR>", { silent = true })
map("n", "<A-down>", ":wincmd j<CR>", { silent = true })
map("n", "<A-up>", ":wincmd k<CR>", { silent = true })
map("n", "<A-right>", ":wincmd l<CR>", { silent = true })

--
-- Git keymaps
--
-- map("n", "<leader>g", ":Git<CR>", { silent = true })
map("n", "<leader>gd", ":Gvdiffsplit<CR>", { silent = true })
map("n", "<leader>gb", ":Telescope git_branches<CR>", { silent = true })

-- Open float diagnostics
map("n", "K", function()
	vim.diagnostic.open_float()
end, { silent = true })

map("n", "<C-K>", vim.lsp.buf.hover, { silent = true })
