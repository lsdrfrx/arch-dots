return {
	{ "github/copilot.vim" },
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("basedpyright")
			vim.lsp.enable("bashls")
			vim.lsp.enable("elixirls")
			vim.lsp.enable("rust_analyzer")
			vim.lsp.enable("zls")
		end,
	},
}
