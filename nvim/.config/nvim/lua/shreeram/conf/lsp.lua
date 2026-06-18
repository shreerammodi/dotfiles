local conform = require("conform")
local mason = require("mason")
local mason_lsp = require("mason-lspconfig")

vim.keymap.set({ "n", "x" }, "<leader>lr", function()
    vim.lsp.buf.rename()
end)

vim.api.nvim_create_user_command("StopLSP", function()
    vim.lsp.Client:stop(vim.lsp.get_clients())
end, {})

vim.lsp.enable("asm_lsp")

vim.lsp.enable("clangd")

vim.lsp.enable("cssls")

vim.lsp.enable("eslint_lsp")

vim.lsp.enable("gopls")

vim.lsp.enable("html")

vim.lsp.enable("kotlin_language_server")

vim.lsp.config("nil_ls", {
    settings = {
        ["nil"] = {
            formatting = {
                command = { "nixfmt" },
            },
        },
    },
})
vim.lsp.enable("nill_ls")

vim.lsp.enable("lua_ls")
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            completion = {
                -- callSnippet = "Replace",
                -- keywordSnippet = "Replace",
            },
            diagnostics = {
                globals = {
                    "bit",
                    "vim",
                    "it",
                    "describe",
                    "before_each",
                    "after_each",
                },
            },
        },
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
vim.lsp.enable("texlab")

vim.lsp.enable("jdtls")

vim.lsp.enable("pyright")

vim.lsp.enable("tailwindcss")

vim.lsp.enable("ts_ls")

conform.setup({
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
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
    },
})
