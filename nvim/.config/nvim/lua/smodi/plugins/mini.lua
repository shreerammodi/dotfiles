add({ gh("nvim-mini/mini.nvim") })

require("mini.surround").setup()

require("mini.ai").setup()

require("mini.jump2d").setup({
	labels = "arstdhneiowfpluyxcvm,.",
})

require("mini.statusline").setup()

require("mini.icons").setup()

require("mini.pairs").setup()
