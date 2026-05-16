vim.pack.add({
	"https://github.com/mbbill/undotree",
})

vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { silent = true })
