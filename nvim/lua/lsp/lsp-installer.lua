local M = {}

function M.setup()
  require("mason").setup()
  local masonconfig = require("mason-lspconfig")
  local lspconfig = require("lspconfig")

  masonconfig.setup()
  local servers = masonconfig.get_installed_servers();

  for _, server_name in pairs(servers) do
    lspconfig[server_name].setup {}
  end
end

return M
