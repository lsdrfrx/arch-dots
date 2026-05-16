vim.pack.add({
	"https://github.com/yamatsum/nvim-cursorline",
})

require("nvim-cursorline").setup({
	cursorword = {
		enable = true,
		min_length = 3,
		hl = { underline = true },
	},
	cursorline = {
		enable = false,
	},
})
