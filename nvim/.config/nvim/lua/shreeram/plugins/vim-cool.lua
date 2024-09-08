return {
	"romainl/vim-cool",
	commit = "662e7b11064cbeedad17c45d2fe926e78d3cd0b6",
	config = function()
		vim.cmd([[set hlsearch]])
	end,
	keys = { "/", "?", "*", "#", "g*", "g#", "n", "N" },
}
