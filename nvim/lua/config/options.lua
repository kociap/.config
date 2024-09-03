vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false

vim.opt.termguicolors = true

-- Cursor
vim.opt.guicursor = "n-v-c-i:block"

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Clipboard
vim.opt.clipboard:append("unnamedplus")

-- Splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Scrolling
vim.opt.scrolloff = 5

-- Rulers
vim.opt.colorcolumn = "81"
