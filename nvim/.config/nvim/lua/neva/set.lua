vim.opt.nu = true
vim.opt.relativenumber = true

-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append "@-@"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.hlsearch = true

-- Use treesitter for folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 10

-- File management
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.wb = false
vim.opt.autoread = true

vim.opt.smartcase = true
vim.opt.lazyredraw = true

vim.opt.ttyfast = true
vim.opt.timeoutlen = 300
vim.opt.updatetime = 300

vim.opt.showmatch = true
vim.opt.wrap = false

vim.opt.laststatus = 3
vim.api.nvim_set_hl(0, "WinSeparator", { guigb = None })


-- highlight yanked text for 200ms using the "Visual" highlight group
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
