vim.g.mapleader = " "

local reg = require("which-key").register

reg({
  ["<leader>f"] = {
    name = "+file",
    f = { "<cmd>Telescope find_files<cr>", "Find File"},
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  },
  ["<leader>e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" }
})

-- Coc
vim.cmd [[ inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
]]

vim.cmd [[ inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
]]
