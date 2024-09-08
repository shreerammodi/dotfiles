return {
	"Olical/conjure",
	version = "4.52.1",
	dependencies = {
		"PaterJason/cmp-conjure",
		"nvim-treesitter/nvim-treesitter",
	},
	ft = { "clojure", "fennel", "python" },
	init = function()
		vim.g["conjure#extract#tree_sitter#enabled"] = true
	end,
}
