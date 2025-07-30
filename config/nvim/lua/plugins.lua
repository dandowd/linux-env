local lspconfig = require("lspconfig")

lspconfig.terraformls.setup({
	on_init = function(client)
		client.server_capabilities.semanticTokensProvider = nil
	end,
})

vim.lsp.config("ts_ls", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript", "javascriptreact", "javascript.jsx",
    "typescript", "typescriptreact", "typescript.tsx"
  },
  root_markers = { "package.json", "tsconfig.json" },
  init_options = {
    hostInfo = "neovim"
  },
  settings = {
    typescript = {
      inlayHints = { includeInlayParameterNameHints = "all" }
    },
    javascript = {
      inlayHints = { includeInlayParameterNameHints = "all" }
    }
  }
})

vim.lsp.enable("ts_ls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("jsonls")
