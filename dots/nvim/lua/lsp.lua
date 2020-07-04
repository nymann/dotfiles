-- lsp setup
local lsp = require'nvim_lsp'

local on_attach_vim = function(client)
    require'lsp_status'.on_attach(client)
    require'diagnostic'.on_attach()
    require'completion'.on_attach({
        sorter = 'alphabet',
        matcher = {'exact', 'fuzzy'}
    })
end

local nvim_lsp = require('nvim_lsp')

nvim_lsp.pyls_ms.setup{
    on_attach=on_attach_vim;
    settings={
        python = {
            linting = {
                enabled = true;
            },
            analysis = {
                disabled = {},
                information = {},
                warnings = {
                    "inherit-non-class",
                    "no-cls-argument",
                    "no-method-argument"
                    "no-self-argument",
                    "parameter-already-specified",
                    "parameter-missing",
                    "positional-argument-after-keyword",
                    "positional-only-named",
                    "return-in-init",
                    "too-many-function-arguments",
                    "too-many-positional-arguments-before-star",
                    "typing-generic-arguments",
                    "typing-newtype-arguments",
                    "typing-typevar-arguments",
                    "undefined-variable",
                    "unknown-parameter-name",
                    "unresolved-import",
                    "variable-not-defined-globally",
                    "variable-not-defined-nonlocal",
                },
                errors = {}
            }
        }
    };
}

