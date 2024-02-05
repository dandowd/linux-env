local lspconfig = require('lspconfig')

lspconfig.tsserver.setup {
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
    end
}

lspconfig.eslint.setup {
    on_attach = function(client, bufnr)
            autocmd('BufWritePre', {
                command = 'EslintFixAll',
            })
    end
}

--vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
--        pattern = "*.js,*.ts,*.jsx,*.tsx,*.html,*.css,*.scss,*.json,*.md,*.svelte",
--        command = "silent exec '!npx prettier --write %'",
--})
