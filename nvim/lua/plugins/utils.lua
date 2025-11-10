return {
	{
		"nvim-mini/mini.icons",
		version = false,
		opts = {},
	},
	{ "nvim-lua/plenary.nvim" },
	{ "tpope/vim-commentary" },
	{ "powerman/vim-plugin-ruscmd" },
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			dashboard = { enabled = true },
			indent = { enabled = true },
		},
	},
	{
		"catgoose/nvim-colorizer.lua",
		opts = {
			user_default_options = {
				mode = "virtualtext",
				virtualtext = "",
				virtualtext_inline = "before",
				names = false,
			},
		},
	},

	{
		"folke/todo-comments.nvim",
		opts = {},
	},
	{
		"kylechui/nvim-surround", -- Working with surrounds
		opts = {},
	},
	{
		"windwp/nvim-autopairs", -- Autopair plugin, pretty simple
		opts = {},
	},
}
