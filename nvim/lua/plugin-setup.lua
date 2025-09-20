local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Plugins without setup
	{ "nvim-tree/nvim-web-devicons" }, -- Pretty icons
	{ "nvim-lua/plenary.nvim" }, -- Dependency for a lot of plugins
	{ "tpope/vim-commentary" }, -- Comment action
	{ "powerman/vim-plugin-ruscmd" }, -- Vim works on russian layout :^)
	{ "tpope/vim-fugitive" }, -- Git integration
	{ "MunifTanjim/nui.nvim" },
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").set_default_mappings()
		end,
	},
	{ "Bekaboo/dropbar.nvim", opts = {} },
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
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"stevearc/oil.nvim",
		opts = {
			delete_to_trash = true,
			view_options = {
				show_hidden = true,
			},
			float = {
				preview_split = "right",
				max_width = 0.5,
				max_height = 0.5,
			},
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
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
		end,
	},
	{
		"folke/todo-comments.nvim",
		opts = {},
	},
	{
		"kylechui/nvim-surround", -- Working with surrounds
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"windwp/nvim-autopairs", -- Autopair plugin, pretty simple
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			views = {
				cmdline_popup = {
					border = {
						style = "single",
						padding = { 2, 2 },
					},
				},
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},

	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
			{
				"<leader>xt",
				"<cmd>Trouble todo toggle<cr>",
				desc = "Todo List (Trouble)",
			},
		},
	},

	require("plugins.themes"),
	require("plugins.lsp"),
	require("plugins.lualine"),
	require("plugins.conform"),
	require("plugins.telescope"),
	require("plugins.treesitter"),
	require("plugins.project"),
	require("plugins.cursorline"),
	require("plugins.render-markdown"),
})
