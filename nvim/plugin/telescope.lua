vim.pack.add({
	"https://github.com/nvim-telescope/telescope.nvim",
})

require("telescope").setup({
	extensions = {
		coc = {
			prefer_locations = true,
			push_cursor_on_edit = true,
			timeout = 3000,
		},
	},
	pickers = {
		buffers = {
			initial_mode = "normal",
			show_all_buffers = true,
			sort_mru = true,
			mappings = {
				n = {
					["<c-d>"] = "delete_buffer",
				},
			},
		},
	},
})

require("telescope").load_extension("projects")

vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { silent = true })
vim.keymap.set("n", "<leader>fm", ":Telescope marks<CR>", { silent = true })
vim.keymap.set("n", "<leader>fp", ":Telescope projects<CR>", { silent = true })
vim.keymap.set("n", "<A-d>", ":Telescope coc definitions<CR>", { silent = true })
vim.keymap.set("n", "<A-r>", ":Telescope coc references<CR>", { silent = true })
