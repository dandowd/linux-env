vim.g.mapleader = " "

local reg = require("which-key").register

reg({
  ["<leader>"] = {
    a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Actions" },
    f = {
      name = "+file",
      f = { "<cmd>Telescope find_files<cr>", "Find File"},
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    },
    e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    h = { "<cmd>noh<cr>", "No Highlight" },
    l = {
      name = "+lsp",
      d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Diagnostics" },
      w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" }, 
    }
  }
})
