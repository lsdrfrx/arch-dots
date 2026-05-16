vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/stevearc/conform.nvim",
})

vim.lsp.enable({
	"lua_ls",
	"bashls",
	"expert",
	"nixd",
	"ocamllsp",
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		html = { "prettier" },
		css = { "prettier" },
		vue = { "prettier" },
		typescript = { "prettier" },
		javascript = { "prettier" },
		rust = { "rustfmt" },
		elixir = { "mix" },
		eelixir = { "mix" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

vim.keymap.set("n", "K", function()
	vim.diagnostic.open_float()
end, { silent = true })

vim.keymap.set("n", "<C-K>", vim.lsp.buf.hover, { silent = true })

vim.diagnostic.config({
	signs = false,
	float = {
		style = "minimal",
		focusable = false,
		header = "",
		prefix = "",
	},
	virtual_text = {
		source = "if_many",
		prefix = " ",
	},
	update_in_insert = true,
	severity_sort = true,
})
