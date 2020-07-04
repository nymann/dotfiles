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
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ld', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>r',  '<cmd>lua vim.lsp.buf.rename()<CR>',                 opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K',          '<Cmd>lua vim.lsp.buf.hover()<CR>',                  opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD',         '<Cmd>lua vim.lsp.buf.declaration()<CR>',            opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ga',         '<Cmd>lua vim.lsp.buf.code_action()<CR>',            opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd',         '<Cmd>lua vim.lsp.buf.definition()<CR>',             opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi',         '<cmd>lua vim.lsp.buf.implementation()<CR>',         opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr',         '<cmd>lua vim.lsp.buf.references()<CR>',             opts)

    if resolved_capabilities.document_highlight then
        vim.api.nvim_command[[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
        vim.api.nvim_command[[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
        vim.api.nvim_command[[autocmd CursorMoved <buffer> lua vim.lsp.util.buf_clear_references()]]
    end
end

local servers = {
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
        name = 'yamlls',
        config = {
          settings = {
            yaml = {
              schemas = {
                ['http://json.schemastore.org/github-workflow'] = '.github/workflows/*.{yml,yaml}',
                ['http://json.schemastore.org/github-action'] = '.github/action.{yml,yaml}',
                ['http://json.schemastore.org/prettierrc'] = '.prettierrc.{yml,yaml}',
                ['http://json.schemastore.org/gitlab-ci'] = '.gitlab-ci.{yml,yaml}'
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
