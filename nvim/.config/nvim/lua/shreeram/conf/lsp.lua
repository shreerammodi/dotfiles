local mason = require("mason")
local lspconfig = require("lspconfig")
local mason_lsp = require("mason-lspconfig")
local null_ls = require("null-ls")
local lsp_augroup = vim.api.nvim_create_augroup("LspFormatting", {})

mason.setup({
    ensure_installed = {
        "asmfmt",
        "black",
        "clang-format",
        "latexindent",
        "nixfmt",
        "prettier",
        "rustywind",
        "shellcheck",
        "shfmt",
    },
})

mason_lsp.setup({
    ensure_installed = {
        "asm_lsp",
        "bashls",
        "clangd",
        "html",
        "jdtls",
        "kotlin_language_server",
        "lua_ls",
        "nil_ls",
        "pyright",
        "tailwindcss",
        "texlab",
        "ts_ls",
    },
})

lspconfig.asm_lsp.setup({})
lspconfig.clangd.setup({})
lspconfig.cssls.setup({})
lspconfig.html.setup({})
lspconfig.kotlin_language_server.setup({})
lspconfig.nil_ls.setup({
    settings = {
        ['nil'] = {
            formatting = {
                command = { "nixfmt" }
            }
        }
    }
})

require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            completion = {
                -- callSnippet = "Replace",
                -- keywordSnippet = "Replace",
            },
            diagnostics = {
                globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
            },
        },
    },
})

lspconfig.texlab.setup({
    settings = {
        texlab = {
            diagnostics = {
                ignoredPatterns = { "Undefined reference" },
            },
        },
    },
})
lspconfig.jdtls.setup({})
lspconfig.pyright.setup({})
lspconfig.tailwindcss.setup({})
lspconfig.ts_ls.setup({})

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.asmfmt,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.nixfmt,
        null_ls.builtins.formatting.prettier.with({
            extra_args = { "--prose-wrap", "always" }
        }),
        null_ls.builtins.formatting.rustywind,
        null_ls.builtins.formatting.stylua,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = lsp_augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = lsp_augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                    vim.lsp.buf.format()
                end,
            })
        end
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    group = lsp_augroup,
    buffer = bufnr,
    callback = function()
        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
        -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
        vim.lsp.buf.format()
    end,
})
