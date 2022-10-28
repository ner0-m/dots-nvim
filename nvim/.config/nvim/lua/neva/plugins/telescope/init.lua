local actions = require "telescope.actions"

require("telescope").setup {
    defaults = {
        color_devicons = true,

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        -- Move prompt to the top and best fitting entry is at the top
        sorting_strategy = "ascending",
        layout_config = {
            horizontal = {
                prompt_position = "top",
            },
        },

        scroll_strategy = "cycle",
        selection_strategy = "reset",

        -- path_display = { "smart" },

        -- These just look nicer then >
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",

        mappings = {
            i = {
                ["<C-q>"] = actions.send_to_qflist,
                ["<C-y>"] = actions.select_default,
            },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        },
    },
}

require("telescope").load_extension "fzy_native"
-- require("telescope").load_extension("git_worktree")

local opts = { noremap = true }

local function map(keybind, command)
    vim.api.nvim_set_keymap("n", keybind, command, opts)
end

local fns = require "neva.plugins.telescope.fns"
local builtin = require "telescope.builtin"

-- File pickers
vim.keymap.set("n", "<C-p>", fns.find_files, opts)
vim.keymap.set("n", "<leader>p", fns.quick_find_files, opts)

-- File picker with only test files
vim.keymap.set("n", "<leader>ft", fns.find_test_files, opts)

-- Pick only CMake files
vim.keymap.set("n", "<leader>fm", fns.find_cmake_files, opts)

-- Search cwd with rg
vim.keymap.set("n", "<leader>f/", builtin.live_grep, opts)

-- Search word under cursor in cwd
vim.keymap.set("n", "<leader>fw", builtin.grep_string, opts)

-- Fuzzy find in current buffer
vim.keymap.set("n", "<leader>/", fns.fuzzy_search_cur_buf, opts)

-- Search in file with rg
vim.keymap.set("n", "<leader>fi", function()
    builtin.grep_string { grep_open_files = true }
end, opts)

-- Search quickfixlist
vim.keymap.set("n", "<leader>fq", builtin.quickfix, opts)

vim.keymap.set("n", "<leader>fp", fns.grep_prompt, opts)

-- Vim pickers
vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, opts)
vim.keymap.set("n", "<leader>fc", builtin.commands, opts)
vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
vim.keymap.set("n", "<leader>fk", builtin.keymaps, opts)
vim.keymap.set("n", "<leader><leader>fc", builtin.command_history, opts)
vim.keymap.set("n", "<leader><leader>fs", builtin.search_history, opts)

-- LSP pickers
vim.keymap.set("n", "<leader>lgr", builtin.lsp_references, opts)
vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, opts)
vim.keymap.set("n", "<leader>lS", builtin.lsp_workspace_symbols, opts)
vim.keymap.set("n", "<leader>lgi", builtin.lsp_implementations, opts)
vim.keymap.set("n", "<leader>lgd", builtin.lsp_definitions, opts)
-- TODO: find replacements
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action)

-- Git pickers
vim.keymap.set("n", "<leader>gc", builtin.git_commits, opts)
vim.keymap.set("n", "<leader>gb", builtin.git_branches, opts)
vim.keymap.set("n", "<leader>gcb", builtin.git_bcommits, opts)
vim.keymap.set("n", "<leader>gst", builtin.git_status, opts)

-- List pickers
vim.keymap.set("n", "<leader>fbi", builtin.builtin, opts)

-- Find files in Neovim config
map(

    "<leader>fn",
    '<cmd>lua require("telescope.builtin").find_files({cwd="~/.config/nvim", file_ignore_patterns={"bundle"}})<cr>'
)

-- git-worktree mappings for telescope
map("<leader>gw", '<cmd>lua require("telescope").extensions.git_worktree.git_worktrees()<cr>')

map("<leader>gwc", '<cmd>lua require("telescope").extensions.git_worktree.create_git_worktree()<cr>')
