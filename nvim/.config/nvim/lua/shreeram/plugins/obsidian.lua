return {
	"epwalsh/obsidian.nvim",
	version = "3.9.0",
	ft = "markdown",
	dependencies = {
		{ "nvim-lua/plenary.nvim", opt = true },
		{ "hrsh7th/nvim-cmp", opt = true },
		{ "nvim-telescope/telescope.nvim", opt = true },
		{ "nvim-treesitter/nvim-treesitter", opt = true },
	},
	opts = {
		workspaces = {
			{
				name = "notes",
				path = "~/Documents/notes",
			},
		},
		daily_notes = { folder = "journal" },
		follow_url_func = function(url)
			vim.fn.jobstart({ "open", url })
		end,
		disable_frontmatter = true,
	},
	keys = {
		{
			"<leader>of",
			"<cmd>ObsidianQuickSwitch<cr>",
			desc = "Switch Files",
		},
		{
			"<leader>os",
			"<cmd>ObsidianSearch<cr>",
			desc = "Search",
		},
		{
			"<leader>ot",
			"<cmd>ObsidianTags<cr>",
			desc = "Tags",
		},
		{
			"<leader>od",
			"<cmd>ObsidianToday<cr>",
			desc = "Go to Today",
		},
		{
			"<leader>ob",
			"<cmd>ObsidianBacklinks<cr>",
			desc = "View Backlinks",
		},
		{
			"<leader>or",
			"<cmd>ObsidianRename<cr>",
			desc = "Rename Document",
		},
		{
			"<leader>ol",
			"<cmd>ObsidianLink<cr>",
			desc = "Link",
			mode = "v",
		},
	},
}
