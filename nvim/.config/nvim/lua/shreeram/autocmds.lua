vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.gs",
    callback = function()
        vim.bo.filetype = "javascript"
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local fname = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(args.buf), ":t")
        if fname:match("^claude%-prompt%-") then
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if client then client:stop() end
            vim.diagnostic.enable(false, { bufnr = args.buf })
        end
    end,
})
