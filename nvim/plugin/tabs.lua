vim.pack.add({
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	{ src = "https://github.com/romgrk/barbar.nvim", version = "v1.9.0" },
})

vim.g.barbar_auto_setup = false

require("barbar").setup({
	animation = true,
	auto_hide = false,
	tabpages = true,
	clickable = true,
	focus_on_close = "left",
	hide = {
		extensions = true,
	},
	icons = {
		buffer_index = false,
		buffer_number = false,
		diagnostics = {
			[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "" },
			[vim.diagnostic.severity.WARN] = { enabled = true, icon = "" },
			[vim.diagnostic.severity.INFO] = { enabled = false },
			[vim.diagnostic.severity.HINT] = { enabled = false },
		},
		gitsigns = {
			enabled = true,
			added = { enabled = true, icon = "+" },
			changed = { enabled = true, icon = "~" },
			deleted = { enabled = true, icon = "-" },
		},
		filetype = {
			enabled = true,
			custom_colors = false,
		},
		separator = { left = "", right = "" },
		separator_at_end = false,
		modified = { button = "●" },
		pinned = { button = "", filename = true },
	},
	maximum_length = 40,
	minimum_padding = 1,
	maximum_padding = 2,
	semantic_letters = true,
})
