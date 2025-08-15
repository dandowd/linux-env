local lspconfig = require("lspconfig")

lspconfig.terraformls.setup({
	on_init = function(client)
		client.server_capabilities.semanticTokensProvider = nil
	end,
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("jsonls")
vim.lsp.enable("vtsls")
vim.lsp.enable('terraform_lsp')
