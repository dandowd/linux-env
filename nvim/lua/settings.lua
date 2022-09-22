local o = vim.o
local g = vim.g
local opt = vim.opt

o.tabstop=2
o.shiftwidth=2
o.expandtab=true
o.smartindent=true
o.number=true

g.cursorhold_updatetime = 100
g.loaded = 1
g.loaded_netrwPlugin = 1

opt.termguicolors = true

vim.cmd [[ set mouse=a ]]
vim.cmd [[ set signcolumn=yes ]]
vim.cmd [[ set clipboard=unnamedplus ]]
vim.cmd [[ set foldmethod=syntax ]]
vim.cmd [[ set foldlevelstart=20 ]]

vim.cmd [[ colorscheme nordfox ]]
