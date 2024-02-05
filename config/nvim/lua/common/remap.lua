vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>")
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

vim.keymap.set("n", "<leader>e", "<cmd>Explore<CR>")
vim.keymap.set("n", "<leader>wd", "<cmd>cd %:h<CR>")

vim.keymap.set("n", "<leader>nf", "<cmd>Neoformat<CR>")

-- NeoTest
vim.keymap.set("n", "<leader>jn", "<cmd>lua require('neotest').run.run()<CR>")
vim.keymap.set("n", "<leader>js", "<cmd>lua require('neotest').run.stop()<CR>")
vim.keymap.set("n", "<leader>jf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>")
vim.keymap.set("n", "<leader>jo", "<cmd>lua require('neotest').output.open()<CR>")
vim.keymap.set("n", "<leader>jd", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>")

-- DAP
vim.keymap.set("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>dc", "<cmd>lua require('dap').continue()<CR>")
vim.keymap.set("n", "<leader>di", "<cmd>lua require('dap').step_into()<CR>")
vim.keymap.set("n", "<leader>do", "<cmd>lua require('dap').step_over()<CR>")
vim.keymap.set("n", "<leader>du", "<cmd>lua require('dapui').toggle()<CR>")

-- LSP
vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)

vim.keymap.set("n", "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<CR>")

-- Trouble
vim.keymap.set("n", "<leader>x", "<cmd>TroubleToggle<CR>")

vim.g.copilot_no_tab_map = true

-- Bufferline
vim.keymap.set("n", "<S-L>", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-H>", "<cmd>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "gb", "<cmd>BufferLinePick<CR>")

vim.keymap.set("n", "<leader>bc", "<cmd>bde<CR>")

vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
