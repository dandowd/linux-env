local lspconfig = require('lspconfig')

lspconfig.terraformls.setup({
  on_init = function(client)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

lspconfig.ts_ls.setup{
  flags = {
    debounce_text_changes = 150,
  },
  root_dir = function(fname)
    return lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git")(fname) or vim.loop.os_homedir()
  end,
  settings = {
  -- Example settings
    typescript = {
      exclude = { "node_modules" },
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      exclude = { "node_modules" },
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  }
}
