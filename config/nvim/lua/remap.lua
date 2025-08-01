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

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>e", "<cmd>Explore<CR>")
vim.keymap.set("n", "<leader>wd", "<cmd>cd %:h<CR>")

vim.keymap.set("n", "<leader>nf", "<cmd>Neoformat<CR>")

vim.keymap.set("n", "<leader>t", "<cmd>Neotree toggle<CR>")
vim.keymap.set("n", "<leader>to", "<cmd>Neotree toggle %<CR>")

-- NeoTest
vim.keymap.set("n", "<leader>jn", "<cmd>lua require('neotest').run.run()<CR>")
vim.keymap.set("n", "<leader>js", "<cmd>lua require('neotest').run.stop()<CR>")
vim.keymap.set("n", "<leader>jf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>")
vim.keymap.set("n", "<leader>jo", "<cmd>lua require('neotest').output.open()<CR>")
vim.keymap.set("n", "<leader>jd", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>")

-- DAP
vim.keymap.set("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>dc", "<cmd>lua require('dap').continue()<CR>")
vim.keymap.set("n", "<leader>rdc", "<cmd>lua require('dap').run_to_cursor()<CR>")
vim.keymap.set("n", "<leader>di", "<cmd>lua require('dap').step_into()<CR>")
vim.keymap.set("n", "<leader>do", "<cmd>lua require('dap').step_over()<CR>")
vim.keymap.set("n", "<leader>du", "<cmd>lua require('dapui').toggle()<CR>")

-- LSP
vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gk", vim.lsp.buf.signature_help)

vim.keymap.set("n", "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<CR>")

-- Trouble
vim.keymap.set("n", "<leader>x", "<cmd>Trouble diagnostics toggle<CR>")


vim.keymap.set("n", "<leader>bc", "<cmd>bde<CR>")

vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>y", '"+y')

vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})

vim.keymap.set("n", "<leader>l", function()
  vim.o.relativenumber = not vim.o.relativenumber
end, { desc = "Toggle relative line numbers" })

vim.g.copilot_no_tab_map = true
