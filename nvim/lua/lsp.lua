local null_ls = require('null-ls')

require('mason').setup()
require('mason-lspconfig').setup()

require('lspconfig').tsserver.setup {}
require('lspconfig').sumneko_lua.setup {}

local sources = {
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.code_actions.eslint_d
}

null_ls.setup({ sources = sources })
