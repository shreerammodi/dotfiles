return {
	"L3MON4D3/LuaSnip",
	version = "2.3.0", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	event = "InsertEnter",
	build = "make install_jsregexp",
	config = function()
		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })
		require("shreeram.conf.luasnip")
	end,
	opts = {
		history = true,
		delete_check_events = "TextChanged",
	},
}
