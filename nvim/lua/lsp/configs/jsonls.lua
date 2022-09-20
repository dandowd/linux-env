local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

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
