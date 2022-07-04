require("mini.cursorword").setup()

require("mini.trailspace").setup()

require("mini.surround").setup {
    mappings = {
        add = "ca", -- Add surrounding
        delete = "cd", -- Delete surrounding
        find = "cf", -- Find surrounding (to the right)
        find_left = "cF", -- Find surrounding (to the left)
        highlight = "ch", -- Highlight surrounding
        replace = "cr", -- Replace surrounding
        update_n_lines = "cn", -- Update `n_lines`
    },
}

require("mini.indentscope").setup()

-- Make is nice and violet :^)
vim.cmd("hi MiniIndentscopeSymbol cterm=nocombine ctermfg=11 gui=nocombine guifg=#bb9af7")

require("mini.pairs").setup{}
require("mini.jump").setup{}
