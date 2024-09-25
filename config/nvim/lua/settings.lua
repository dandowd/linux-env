vim.o.signcolumn = "yes"

vim.o.number = true
vim.o.relativenumber = true

vim.o.swapfile = false

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.termguicolors = true

vim.o.updatetime = 50

vim.o.autoindent = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2

vim.o.smartcase = true
vim.o.ignorecase = true

vim.cmd([[ set termguicolors ]])
vim.cmd([[ set background=dark ]])
vim.cmd([[ colorscheme gruvbox ]])

vim.cmd([[ set splitright ]])

vim.g.neoformat_try_node_exe = 1
