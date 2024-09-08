return {
	"iurimateus/luasnip-latex-snippets.nvim",
	commit = "4b91f28d91979f61a3e8aef1cee5b7c7f2c7beb8",
	dependencies = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
	ft = "tex",
	config = function()
		require("luasnip-latex-snippets").setup()
		-- or setup({ use_treesitter = true })
		require("luasnip").config.setup({ enable_autosnippets = true })
	end,
}
