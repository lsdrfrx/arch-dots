vim.pack.add({
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/braxtons12/blame_line.nvim",
})

require("gitsigns").setup()
require("blame_line").setup({
	show_in_insert = false,
	delay = 500,
})

vim.keymap.set("n", "<leader>gg", "<cmd>Git<CR>", { desc = "Git" })
vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit<CR>", { desc = "Git Diff (Vertical)" })
vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Git Branches (Telescope)" })
