-- The following line allows auto complete
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local M = {
  capabilities = capabilities,
  settings = {
    yaml = {
      format = {
        enable = true
      },
      customTags = {
        "!GetAtt",
        "!Sub"
      },
      schemas = require("schemastore").json.schemas()
    }
  }
}

return M
