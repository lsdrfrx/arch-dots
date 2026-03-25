return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		opts = {
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
		},
	},
}
