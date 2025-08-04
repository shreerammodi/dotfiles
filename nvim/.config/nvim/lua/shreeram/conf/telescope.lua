-- TODO set the cwd for file browser to the current buffer open in vim
-- TODO dynamically set project mappings like doom emacs
local function is_git_repo()
    local result = vim.fn.systemlist("git rev-parse --is-inside-work-tree")[1]
    return vim.v.shell_error == 0 and result == "true"
end

local function find_git_root()
    return vim.fn.systemlist("git rev-parse --show-toplevel")[1]
end

local function find_project_name()
    local project_dir = find_git_root()
    local project_name = string.match(project_dir, "([^/]+)$")
    return project_name
end

local function get_cwd()
    local full_path = vim.uv.cwd()

    local components = {}
    for dir in string.gmatch(full_path, "[^/]+") do
        table.insert(components, dir)
    end

    return "…/" .. components[#components - 1] .. "/" .. components[#components] .. "/"
end

require("telescope").setup({
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
        },
    },
    pickers = {
        buffers = { theme = "ivy" },
        find_files = { theme = "ivy" },
        git_files = { theme = "ivy" },
        grep_string = { theme = "ivy", },
        help_tags = { theme = "ivy" },
        live_grep = { theme = "ivy", },
    },
    extensions = {
        file_browser = {
            theme = "ivy",
            hidden = true,
        },
    }
})

require("telescope").load_extension("file_browser")

vim.api.nvim_create_user_command("Colorscheme", function()
    require("telescope.builtin").colorscheme({})
end, {})

local builtin = require("telescope.builtin")
local extensions = require("telescope").extensions

vim.keymap.set("n", "<leader>ff", function() extensions.file_browser.file_browser({}) end, { desc = "Find file" })

vim.keymap.set("n", "<leader>.", function() extensions.file_browser.file_browser({}) end, { desc = "Find file" })

if is_git_repo() then
    vim.keymap.set("n", "<leader>pf", function()
        builtin.git_files({
            prompt_title = string.format("[%s] Find File", find_project_name())
        })
    end, { desc = "Search git files" })

    vim.keymap.set("n", "<leader><leader>", function()
        builtin.git_files({
            prompt_title = string.format("[%s] Find File", find_project_name())
        })
    end, { desc = "Search git files" })

    vim.keymap.set("n", "<leader>swp", function()
        local word = vim.fn.expand("<cword>")
        builtin.grep_string({
            search = word,
            cwd = find_git_root(),
            prompt_title = string.format('Search Project [%s] for "%s"', find_project_name(), word)
        })
    end, { desc = "Search project for word" })

    vim.keymap.set("n", "<leader>sWp", function()
        local word = vim.fn.expand("<cWORD>")
        builtin.grep_string({
            search = word,
            cwd = find_git_root(),
            prompt_title = string.format('Search Project [%s] for "%s"', find_project_name(), word)
        })
    end, { desc = "Search project for WORD" })

    vim.keymap.set("n", "<leader>sp", function()
        builtin.live_grep({
            cwd = find_git_root(),
            prompt_title = string.format('Search Project [%s]', find_project_name())
        })
    end, { desc = "Search project" })

    vim.keymap.set("n", "<leader>/", function()
        builtin.live_grep({
            cwd = find_git_root(),
            prompt_title = string.format('Search Project [%s]', find_project_name())
        })
    end, { desc = "Search project" })
end

vim.keymap.set("n", "<leader>swd", function()
    local word = vim.fn.expand("<cword>")
    builtin.grep_string({
        search = word,
        prompt_title = string.format('Search Directory [%s] for "%s"', get_cwd(), word)
    })
end, { desc = "Search directory for word" })

vim.keymap.set("n", "<leader>sWd", function()
    local word = vim.fn.expand("<cWORD>")
    builtin.grep_string({
        search = word,
        prompt_title = string.format('Search Directory [%s] for "%s"', get_cwd(), word)
    })
end, { desc = "Search directory for WORD" })

vim.keymap.set("n", "<leader>sd", function()
    builtin.live_grep({
        prompt_title = string.format('Search Directory [%s]', get_cwd())
    })
end, { desc = "Search directory" })

vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search help tags" })

vim.keymap.set("n", "<leader>,", builtin.buffers, { desc = "Switch buffer" })
vim.keymap.set("n", "<leader>bb", builtin.buffers, { desc = "Switch buffer" })
