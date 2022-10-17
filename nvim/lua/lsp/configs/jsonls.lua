local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local M = {
  capabilities = capabilities,
  settings = {
    json = {
      format = { enable = true },
      schemas = require("schemastore").json.schemas(),
    }
  }
}

return M
