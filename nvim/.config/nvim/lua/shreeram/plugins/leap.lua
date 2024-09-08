return {
	"ggandor/leap.nvim",
	commit = "c6bfb191f1161fbabace1f36f578a20ac6c7642c",
	dependencies = {
		{ "tpope/vim-repeat", opt = true },
	},
	config = function()
		require("shreeram.conf.leap")
	end,
}
