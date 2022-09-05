vim.g.mapleader = " "

local reg = require("which-key").register

reg({
  ["<leader>"] = {
    a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Actions" },
    f = {
      name = "+files",
      f = { "<cmd>Telescope find_files<cr>", "Find File"},
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      g = { "<cmd>Telescope live_grep<CR>", "Grep Files" }
    },
    e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    h = { "<cmd>noh<cr>", "No Highlight" },
    d = {
      name = "+diagnostics",
      d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Diagnostics" },
      w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
    }
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
