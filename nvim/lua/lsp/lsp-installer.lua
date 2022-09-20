local M = {}
function M.setup()
  require("mason").setup()
  local masonconfig = require("mason-lspconfig")
  local lspconfig = require("lspconfig")

  masonconfig.setup()
  local servers = masonconfig.get_installed_servers()

  for _, server_name in pairs(servers) do
    local configLocation = string.format("lsp.configs.%s", server_name)
    if pcall(require, configLocation) then
      local langSettings = require(configLocation)
      lspconfig[server_name].setup(langSettings)
    else
      lspconfig[server_name].setup {}
    end
  end
end

return M
