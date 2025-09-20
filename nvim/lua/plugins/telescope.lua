return {
	{ "fannheyward/telescope-coc.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		config = function()
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
		end,
	},
}
