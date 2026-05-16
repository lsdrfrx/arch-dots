vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-neo-tree/neo-tree.nvim",
})

require("neo-tree").setup({
	close_if_last_window = true,
	window = {
		position = "right",
		width = 30,
		mappings = {
			["j"] = "<left>",
			["k"] = "<down>",
			["l"] = "<up>",
			[";"] = "<right>",
		},
	},
})

vim.keymap.set("n", "-", "<cmd>Neotree<CR>", { silent = true })
