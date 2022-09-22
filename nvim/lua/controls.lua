vim.g.mapleader = " "

local reg = require("which-key").register
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  dir = "git_dir"
})

function _lazygit_toggle()
  lazygit:toggle()
end

function _open_tabbed_term()
  Terminal:new({
    hidden = true,
    direction = "tab",
    dir = "git_dir"
  }):open()
end

map("n", "<S-h", "<cmd>BufferPrevious<CR>", opts)
map("n", "<S-l", "<cmd>BufferNext<CR>", opts)

reg({
  ["<leader>"] = {
    x = {
      name = "+terminal",
      f = { "<cmd>ToggleTerm<CR>", "Floating" },
      t = { "<cmd>lua _open_tabbed_term()<CR>", "Tabbed" }
    },
    g = { "<cmd>lua _lazygit_toggle()<CR>", "Git" },
    t = {
      name = "+test",
      n = { "<cmd>lua require('neotest').run.run()<CR>", "Nearest" },
      f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "File" }
    },
    a = {
      name = "+actions",
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Actions" },
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
      f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format" }
    },
    f = {
      name = "+files",
      f = { "<cmd>Telescope find_files<cr>", "Find Files" },
      o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
      g = { "<cmd>Telescope live_grep<CR>", "Grep Files" },
      s = { "<cmd>Telescope grep_string<CR>", "Grep String" },
      b = { "<cmd>Telescope buffers<CR>", "Buffers" },
      r = { "<cmd>Telescope registers<CR>", "Registers" },
      m = { "<cmd>Telescope marks<CR>", "Marks" }
    },
    e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    h = { "<cmd>noh<cr>", "No Highlight" },
    d = {
      name = "+diagnostics",
      d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Diagnostics" },
      w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
      l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" }
    },
    p = { "<cmd>lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>", "Projects" }
  }
})

-- LSP bindings
reg({
  g = {
    D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
    i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
    r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
    s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature" }
  },
  K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" }
})
