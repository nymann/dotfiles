local protocol = require('vim.lsp.protocol')
local lspconfig = require('lspconfig')

--- Document highlights
local function document_highlight()
	vim.api.nvim_exec([[
		hi LspReferenceRead  guibg=#121111 guifg=#FFFF00
		hi LspReferenceText  guibg=#121111 guifg=#FFFF00
		hi LspReferenceWrite guibg=#121111 guifg=#FFFF00

		augroup lsp_document_highlight
			autocmd!
			autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
			autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
			autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
		augroup END
	]], false)
end

-- vim.lsp.set_log_level("debug")
local on_attach = function()
  document_highlight()

  protocol.CompletionItemKind = {
    '';             -- Text          = 1;
    'ƒ';             -- Method        = 2;
    'ƒ';             -- Function      = 3;
    '';             -- Constructor   = 4;
    '識';            -- Field         = 5;
    '𝑋';             -- Variable      = 6;
    '';             -- Class         = 7;
    '';             -- Interface     = 8;
    '';             -- Module        = 9;
    'Property';      -- Property      = 10;
    'Unit';          -- Unit          = 11;
    'Value';         -- Value         = 12;
    '了';            -- Enum          = 13;
    '';             -- Keyword       = 14;
    '﬌';             -- Snippet       = 15;
    'Color';         -- Color         = 16;
    '';             -- File          = 17;
    'Reference';     -- Reference     = 18;
    '';             -- Folder        = 19;
    '';             -- EnumMember    = 20;
    '';             -- Constant      = 21;
    '';             -- Struct        = 22;
    'Event';         -- Event         = 23;
    'Operator';      -- Operator      = 24;
    'TypeParameter'; -- TypeParameter = 25;
  }
  require('lsp_signature').on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
                 -- If you want to hook lspsaga or other signature handler, pls set to false
    doc_lines = 10, -- only show one line of comment set to 0 if you do not want API comments be shown

    hint_enable = true, -- virtual hint enable
    hint_prefix = "🐼 ",  -- Panda for parameter
    hint_scheme = "String",

    handler_opts = {
      border = "shadow"   -- double, single, shadow, none
    },
    decorator = {"**", "**"}  -- or decorator = {"***", "***"}  decorator = {"**", "**"} see markdown help
  })
end

local capabilities = protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
 vim.lsp.diagnostic.on_publish_diagnostics, {
   underline = false, -- Enable underline, use default values
   virtual_text = false -- Enable virtual text only on Warning or above, override spacing to 2
 }
)
vim.fn.sign_define(
    "LspDiagnosticsSignError",
    {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignWarning",
    {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignHint",
    {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignInformation",
    {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"}
)

local servers = {'pyright'}
--local servers = {'jedi_language_server'}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities
}
end

--lspconfig.texlab.setup{
--  on_attach = on_attach,
--  capabilities = capabilities,
--  settings = {
--    latex = {
--      rootDirectory = ".",
--      build = {
--        args = { "-shell-escape", "-pdf", "-pvc","-lualatex", "-interaction=nonstopmode", "synctex=1", "report.tex" },
--        executable = "latexmk",
--        --outputDirectory = {"."},
--        forwardSearchAfter = false,
--        onSave = true
--      },
--      --forwardSearch = {
--      --  executable = "zathura",
--      --  args = {"--synctex-forward", "%l:1:%f", "%p"},
--      --  onSave = false
--      --}
--    }
--  }
--}

-- java language server
local root_pattern = lspconfig.util.root_pattern
lspconfig.jdtls.setup {
  root_dir = root_pattern(".git"),
  cmd = {"jdtls"},
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.sumneko_lua.setup {
  cmd = {"lua-language-server"},
  autostart = false,
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
}

lspconfig.efm.setup {
  cmd = {"efm-langserver"},
  init_options = {documentFormatting = true, codeAction = false},
  filetypes = {"python"},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      python = {
        formatCommand = "black --quiet - ",
        formatStdin = true,
        lintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
        lintStdin = true,
        lintIgnoreExitCode = true,
        lintFormats = {"%f:%l:%c:%t:%m"}
      }
    }
  }
}
