add({
	gh("mason-org/mason.nvim"),
	gh("neovim/nvim-lspconfig"),
	gh("stevearc/conform.nvim"),
	gh("chentoast/marks.nvim"),
	gh("saghen/blink.cmp"),
	gh("saghen/blink.lib"),
})

require("marks").setup()

require("mason").setup()

require("conform").setup({
	formatters_by_ft = {
		c = { "clang-format" },
		cpp = { "clang-format" },
		css = { "prettier" },
		html = { "prettier" },
		javascript = { "prettier" },
		json = { "prettier" },
		latex = { "tex-fmt" },
		lua = { "stylua" },
		markdown = { "prettier", "markdownlint" },
		python = { "isort", "black" },
		typescript = { "prettier" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

vim.lsp.config("texlab", {
	settings = {
		texlab = {
			diagnostics = {
				ignoredPatterns = { "Undefined reference" },
			},
		},
	},
})

vim.lsp.enable({
	"clangd",
	"cssls",
	"gopls",
	"html",
	"lua_ls",
	"pyright",
	"texlab",
	"ts_ls",
})

local cmp = require("blink.cmp")

cmp.build():pwait()

cmp.setup({
	completion = {
		menu = {
			auto_show = true,
			border = "single",
		},
		documentation = {
			auto_show = true,
			window = { border = "single" },
		},
	},
	signature = { window = { border = "single" } },
})
