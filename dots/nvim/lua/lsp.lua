-- Setup inspired from: https://github.com/ahmedelgabri/dotfiles/blob/26f32ba6aae362a20095523b180f5f06d74f5bcb/roles/vim/files/.vim/lua/lsp.lua
local has_lsp, nvim_lsp = pcall(require, 'nvim_lsp')
local has_completion, completion = pcall(require, 'completion')
local has_diagnostic, diagnostic = pcall(require, 'diagnostic')
local has_status, lsp_status = pcall(require, 'lsp_status')

if not has_lsp then
    return
end

-- highlights
vim.fn.sign_define('LspDiagnosticsErrorSign', {
    text='✖ ' or 'E',
    texthl='LspDiagnosticsError',
    linehl='',
    numhl=''
})
vim.fn.sign_define('LspDiagnosticsWarningSign', {
    text='⚠' or 'W',
    texthl='LspDiagnosticsWarning',
    linehl='',
    numhl=''
})
vim.fn.sign_define('LspDiagnosticsInformationSign', {
    text='כֿ' or 'I',
    texthl='LspDiagnosticsInformation',
    linehl='',
    numhl=''
})
vim.fn.sign_define('LspDiagnosticsHintSign', {
    text='➤' or 'H',
    texthl='LspDiagnosticsHint',
    linehl='',
    numhl=''
})

local on_attach_vim = function(client, bufnr)
    local resolved_capabilities = client.resolved_capabilities

    if has_status then
        lsp_status.on_attach(client)
    end

    if has_diagnostic then
        diagnostic.on_attach()
    end

    if has_completion then
        completion.on_attach({
            sorter = 'alphabet',
            matcher = {'exact', 'fuzzy'}
        })
    end

    local opts = { noremap=true, silent=true }

    if resolved_capabilities.document_highlight then
        vim.api.nvim_command[[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
        vim.api.nvim_command[[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
        vim.api.nvim_command[[autocmd CursorMoved <buffer> lua vim.lsp.util.buf_clear_references()]]
    end
end

local servers = {
    --{
        --name = 'jedi_language_server'
    --},
    {
        name = 'pyls_ms',
        config = {
            settings={
                python = {
                    linting = {
                        enabled = true;
                    },
                    analysis = {
                        disabled = {
                            "typing-generic-arguments",
                            "typing-typevar-arguments"
                        },
                        information = {},
                        warnings = {
                            "inherit-non-class",
                            "no-cls-argument",
                            "no-method-argument",
                            "no-self-argument",
                            "parameter-already-specified",
                            "parameter-missing",
                            "positional-argument-after-keyword",
                            "positional-only-named",
                            "return-in-init",
                            "too-many-function-arguments",
                            "too-many-positional-arguments-before-star",
                            "typing-newtype-arguments",
                            "undefined-variable",
                            "unknown-parameter-name",
                            "unresolved-import",
                            "variable-not-defined-globally",
                            "variable-not-defined-nonlocal"
                        },
                        errors = {}
                    }
                }
            };
        }
    },
    {
        name = 'diagnosticls',
        config = {
            filetypes = {
                'json',
                'sh'
            },
            init_options = {
                linters = {
                    shellcheck = {
                        command = "shellcheck",
                        debounce = 100,
                        args = { "--format=gcc", "--shell=sh", "-" },
                        offsetLine = 0,
                        offsetColumn = 0,
                        sourceName = "shellcheck",
                        formatLines = 1,
                        formatPattern = {
                            "^[^:]+:(\\d+):(\\d+):\\s+([^:]+):\\s+(.*)$",
                            {
                                line = 1,
                                column = 2,
                                message = 4,
                                security = 3
                            }
                        },
                        securities = {
                            refactor = "info",
                            convention = "info",
                            error = "error",
                            warning = "warning",
                            note = "info"
                        },
                    },
                    pylint = {
                        command = "pylint",
                        args = {
                            "--output-format=text",
                            "--score=no",
                            "--msg-template='{line}:{column}:{category}:{msg} ({msg_id}:{symbol})'",
                            "%file"
                        },
                        offsetLine = 1,
                        offsetColumn = 1,
                        sourceName = "pylint",
                        formatLines = 1,
                        formatPattern = { 
                            "^[^:]+:(\\d+):(\\d+):\\s+([^:]+):\\s+(.*)$",
                            {
                                line = 1,
                                column = 2,
                                message = 4,
                                security = 3
                            }
                        },
                        rootPatterns = {
                            ".git", "setup.py"
                        },
                        securities = {
                            informational = "hint",
                            refactor = "info",
                            convention = "info",
                            warning = "warning",
                            error = "error",
                            fatal = "error"
                        }
                    }
                },
                filetypes = {
                    sh = "shellcheck"
                }
            }
        } 
    },
    {
        name = 'yamlls',
        config = {
          settings = {
            yaml = {
              schemas = {
                ['http://json.schemastore.org/github-workflow'] = '.github/workflows/*.{yml,yaml}',
                ['http://json.schemastore.org/github-action'] = '.github/action.{yml,yaml}',
                ['http://json.schemastore.org/prettierrc'] = '.prettierrc.{yml,yaml}',
                ['http://json.schemastore.org/gitlab-ci'] = '.gitlab-ci.{yml,yaml}',
                ['https://json.schemastore.org/pre-commit-config'] = '.pre-commit-config.{yml,yaml}'
              },
              validate = true,
              hover = true,
              completion = true,
              format = {
                  enable = true
              }
            }
          },
        }
    }
}

for _, lsp in ipairs(servers) do
  if lsp.config then
    lsp.config.on_attach = on_attach_vim
  else
    lsp.config = {
      on_attach = on_attach_vim
    }
  end

  nvim_lsp[lsp.name].setup(lsp.config)
end
