vim.pack.add({
  { src = "https://github.com/L3MON4D3/LuaSnip", version = "v2.5.0" },
})

require("luasnip.loaders.from_snipmate").load()
