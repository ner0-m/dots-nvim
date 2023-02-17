-- Necessary for lazy.nvim to be set in the beginning
vim.g.mapleader = " "

require "neva.remap"
require "neva.set"
require "neva.lazy"
require "neva.globals"

local ui = require "harpoon.ui"
vim.keymap.set("n", "<C-d>", ui.toggle_quick_menu, { desc = "Toggle harpoon ui" })

