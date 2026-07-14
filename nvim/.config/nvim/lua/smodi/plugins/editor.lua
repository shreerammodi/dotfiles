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
        css = { "oxfmt" },
        html = { "oxfmt" },
        javascript = { "oxfmt" },
        json = { "oxfmt" },
        latex = { "tex-fmt" },
        lua = { "stylua" },
        markdown = { "markdownlint" },
        python = { "isort", "black" },
        typescript = { "oxfmt" },
        toml = { "oxfmt" },
        yaml = { "oxfmt" },
    },
})

map({ "n" }, "<leader>lf", function()
    require("conform").format()
end, { desc = "Format buffer" })

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
    "css-lsp",
    "gopls",
    "html-lsp",
    "lua_ls",
    "markdownlint",
    "oxlint",
    "pyright",
    "tailwindcss-language-server",
    "texlab",
    "tinymist",
    "ts_ls",
})

local cmp = require("blink.cmp")

cmp.build():pwait()

cmp.setup({
    completion = {
        list = {
            selection = { preselect = false, auto_insert = true },
        },
        menu = {
            auto_show = true,
            border = "single",
            draw = {
                components = {
                    kind_icon = {
                        text = function(ctx)
                            local kind_icon, _, _ =
                                require("mini.icons").get("lsp", ctx.kind)
                            return kind_icon
                        end,
                        -- (optional) use highlights from mini.icons
                        highlight = function(ctx)
                            local _, hl, _ =
                                require("mini.icons").get("lsp", ctx.kind)
                            return hl
                        end,
                    },
                    kind = {
                        -- (optional) use highlights from mini.icons
                        highlight = function(ctx)
                            local _, hl, _ =
                                require("mini.icons").get("lsp", ctx.kind)
                            return hl
                        end,
                    },
                },
            },
        },
        documentation = {
            auto_show = true,
            window = { border = "single" },
        },
    },
    keymap = {
        preset = "default",
        ["<C-n>"] = { "select_next" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-i>"] = { "accept", "snippet_forward", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "select_and_accept", "fallback" },
        ["<C-Space>"] = { "show" },
    },
    signature = { enabled = true, window = { border = "single" } },
    sources = { default = { "lsp", "snippets", "path" } },
})
