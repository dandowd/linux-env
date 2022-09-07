local o = vim.o

o.tabstop=2
o.shiftwidth=2
o.expandtab=true
o.smartindent=true
o.number=true

vim.cmd [[ colorscheme nordfox ]]
vim.cmd [[ set mouse=a ]]
vim.cmd [[ set signcolumn=yes ]]
vim.cmd [[ set clipboard=unnamedplus ]]
vim.cmd [[ set foldmethod=syntax ]]
vim.cmd [[ set foldlevelstart=20 ]]
