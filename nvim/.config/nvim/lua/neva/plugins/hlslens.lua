if vim.g["g:loaded_nvim_hlslens"] then
    return
end

vim.g["loaded_nvim_hlslens"] = 1

require("hlslens").setup()

local map = require("neva.utils").nmap

-- remap search commands
map("n", "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>")
map("N", "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>")
map("*", "*<Cmd>lua require('hlslens').start()<CR>")
map("#", "#<Cmd>lua require('hlslens').start()<CR>")
map("g*", "g*<Cmd>lua require('hlslens').start()<CR>")
map("g#", "g#<Cmd>lua require('hlslens').start()<CR>")

map("<leader>h", ":noh<CR>")

-- Integrate with nvim-scrollbar
require("scrollbar.handlers.search").setup()
