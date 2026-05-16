vim.pack.add({
	"https://github.com/tpope/vim-commentary",
	"https://github.com/powerman/vim-plugin-ruscmd",
	"https://github.com/folke/todo-comments.nvim",
	"https://github.com/kylechui/nvim-surround",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/catgoose/nvim-colorizer.lua",
	"https://github.com/folke/snacks.nvim",
})

require("todo-comments").setup()
require("nvim-surround").setup()
require("nvim-autopairs").setup()

require("colorizer").setup({
	user_default_options = {
		mode = "virtualtext",
		virtualtext = "",
		virtualtext_inline = "before",
		names = false,
	},
})

require("snacks").setup({
	indent = { enabled = true },
})
