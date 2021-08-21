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

vim.lsp.set_log_level("debug")
local on_attach = function()
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

local on_attach_highlight = function()
  on_attach()
  document_highlight()
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

local servers = {'pyright', 'tsserver'}
--local servers = {'jedi_language_server'}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach_highlight,
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
  on_attach = on_attach_higlight,
  capabilities = capabilities
}

lspconfig.svelte.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    svelte = {
      plugin = {
        svelte = {
          compilerWarnings = {
            ["a11y-no-on-change"] = "ignore"
          }
        }
      }
    }
  }
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.bashls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

local luadev = require("lua-dev").setup {
  library = {
    vimruntime = true, -- runtime path
    types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
    plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
  },
  -- pass any additional options that will be merged in the final lsp config
  lspconfig = {
    cmd = {"lua-language-server"},
    on_attach = on_attach
  },
}
lspconfig.sumneko_lua.setup(luadev)

lspconfig.efm.setup {
  cmd = {"efm-langserver"},
  init_options = {documentFormatting = true, codeAction = false},
  filetypes = {"markdown"},
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
