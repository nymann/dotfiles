local lsp_status = require('lsp-status')
lsp_status.register_progress()

local nvim_lsp = require('nvim_lsp')

nvim_lsp.pyls_ms.setup({
    callbacks = lsp_status.extensions.pyls_ms.setup(),
    settings = { python = { workspaceSymbols = { enabled = true }}},
    on_attach = lsp_status.on_attach,
    capabilities = lsp_status.capabilities
})
