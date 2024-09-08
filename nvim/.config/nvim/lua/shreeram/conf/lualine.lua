local lualine = require("lualine")

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

-- Config
local config = {
    options = {
        component_separators = "",
        section_separators = "",
        theme = "auto",
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "filename" },
        lualine_c = { "branch", "diff" },
        lualine_x = { "diagnostics" },
        lualine_y = { "encoding", { "fileformat", symbols = { unix = "LF", dos = "CRLF", mac = "CR" } }, "filetype" },
        lualine_z = { "location" },
    },
}

-- Now don't forget to initialize lualine
lualine.setup(config)
