return {
    'wllfaria/ledger.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'ledger/vim-ledger' },
    ft = { 'ledger' },
    opts = {
        extensions = { 'ledger', 'hledger', 'journal' },
        completion = {
            cmp = { enabled = true },
        },
        diagnostics = {
            lsp_diagnostics = true,
            strict = false,
        },
        snippets = {
            native  = { enabled = false },
            cmp     = { enabled = true },
            luasnip = { enabled = false },
        },
        keymaps = {
            snippets = {
                new_posting       = { 'tt' },
                new_account       = { 'acc' },
                new_posting_today = { 'td' },
                new_commodity     = { 'cm' },
            },
            reports = {
                { key = '<leader>hb', name = 'Balance',  command = 'hledger bal' },
                { key = '<leader>hr', name = 'Register', command = 'hledger reg' },
                { key = '<leader>hc', name = 'Check',    command = 'hledger check' },
            },
            tui = {
                initialize = { '<leader>ht' },
                shutdown   = { '<leader>hq' },
            },
        },
        tui = {
            enabled     = true,
            open_in_tab = true,
        },
    }
}
