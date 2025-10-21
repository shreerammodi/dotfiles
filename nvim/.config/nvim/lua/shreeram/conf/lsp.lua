local mason = require("mason")
local lspconfig = require("lspconfig")
local mason_lsp = require("mason-lspconfig")
local null_ls = require("null-ls")
local null_ls_helpers = require("null-ls.helpers")
local lsp_augroup = vim.api.nvim_create_augroup("LspFormatting", {})

vim.keymap.set({ "n", "x" }, "<leader>lr", function() vim.lsp.buf.rename() end)

mason.setup({
    ensure_installed = {
        "asmfmt",
        "black",
        "clang-format",
        "isort",
        "latexindent",
        "markdownlint",
        "nixfmt",
        "prettier",
        "rustywind",
        "shellcheck",
        "shfmt",
        "sqlfluff",
        "tex-fmt",
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

vim.lsp.enable('asm_lsp')

vim.lsp.enable('clangd')

vim.lsp.enable('cssls')

vim.lsp.enable('html')

vim.lsp.enable('kotlin_language_server')

vim.lsp.config('nil_ls', {
    settings = {
        ['nil'] = {
            formatting = {
                command = { "nixfmt" }
            }
        }
    }
})
vim.lsp.enable('nill_ls')

vim.lsp.config('lua_ls', {
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
vim.lsp.enable('lua_ls')

vim.lsp.config('texlab', {
    settings = {
        texlab = {
            diagnostics = {
                ignoredPatterns = { "Undefined reference" },
            },
        },
    },
})
vim.lsp.enable('texlab')

vim.lsp.enable('jdtls')

vim.lsp.enable('pyright')

vim.lsp.enable('tailwindcss')

vim.lsp.enable('ts_ls')

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.asmfmt,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.nixfmt,
        null_ls.builtins.formatting.prettier.with({
            filetypes = { "markdown" },
            extra_args = { "--prose-wrap", "always", "--print-width", "80" }
        }),
        null_ls.builtins.formatting.rustywind,
        null_ls.builtins.formatting.stylua.with({
            condition = function(utils)
                return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
            end,
        }),
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.diagnostics.markdownlint.with({
            extra_args = { "--disable", "MD024" }
        }),
        null_ls.builtins.diagnostics.sqlfluff.with({
            extra_args = { "--dialect", "sqlite" },
        }),
        {
            name = "tex-fmt",
            filetypes = { "tex" },
            method = null_ls.methods.FORMATTING,
            generator = null_ls_helpers.formatter_factory({
                command = "tex-fmt",
                args = { "--stdin", "--quiet" },
                to_stdin = true,
            }),
        }
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
