local protocol = require('vim.lsp.protocol')
local lspconfig = require('lspconfig')
local null_ls = require("null-ls")
local h = require("null-ls.helpers")

local cmp = require('cmp')
local lsp_signature = require('lsp_signature')
-- setup nvim-cmp

local signature_cfg = {
  debug = false, -- set to true to enable debug logging
  log_path = "debug_log_file_path", -- debug log path
  verbose = false, -- show debug line number
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
  -- set to 0 if you DO NOT want any API comments be shown
  -- This setting only take effect in insert mode, it does not affect signature help in normal
  -- mode, 10 by default
  floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
  floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
  -- will set to true when fully tested, set to false will use whichever side has more space
  -- this setting will be helpful if you do not want the PUM and floating win overlap
  fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
  hint_enable = true, -- virtual hint enable
  hint_prefix = "🐼 ", -- Panda for parameter
  hint_scheme = "String",
  use_lspsaga = false, -- set to true if you want to use lspsaga popup
  hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
  max_height = 16, -- max height of signature floating_window, if content is more than max_height, you can scroll down
  -- to view the hiding contents
  max_width = 160, -- max_width of signature floating_window, line will be wrapped if exceed max_width
  handler_opts = {
    border = "rounded" -- double, rounded, single, shadow, none
  },
  always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58
  auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
  extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom
  padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc
  transparency = nil, -- disabled by default, allow floating win transparent value 1~100
  shadow_blend = 36, -- if you using shadow as border use this set the opacity
  shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
  timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
  toggle_key = nil -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
}
lsp_signature.setup(signature_cfg)

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
  },
  mapping = {
    ['<S-Tab>'] = cmp.mapping.select_prev_item(), -- previous suggestion
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(), -- manual completion
    ['<C-e>'] = cmp.mapping.close(), -- close completion window
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = false,
    }),
  },
}

local capabilities = protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)


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

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = false,
}
)

local on_attach = function(client, bufnr)
end

local on_attach_highlight = function(client, bufnr)
  on_attach(client, bufnr)
  document_highlight()
end

--local servers = {'pyright', 'tsserver', 'rust_analyzer', 'bashls'}
local servers = { 'pyright', 'refacto', 'tsserver', 'rust_analyzer', 'bashls', 'intelephense', 'solargraph', 'ccls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities
  })
end
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach_null = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end
end

local sources = {
  null_ls.builtins.formatting.black,
  --null_ls.builtins.diagnostics.write_good,
  null_ls.builtins.formatting.isort,
  null_ls.builtins.diagnostics.flake8,
  null_ls.builtins.formatting.pg_format,
  null_ls.builtins.formatting.markdownlint,
  null_ls.builtins.formatting.latexindent,
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.formatting.beautysh,
  null_ls.builtins.code_actions.shellcheck.with({
    args = {"--format", "json1", "--source-path=$DIRNAME", "--external-sources", "-", "--shell=dash"},
  }),
  null_ls.builtins.diagnostics.checkmake
}
null_ls.setup({ sources = sources, on_attach = on_attach_null, capabilities = capabilities })

--local spot_comment = {
--  method = null_ls.methods.DIAGNOSTICS,
--  filetypes = {"python", "py"},
--  generator = {
--    fn = function(params)
--      local diagnostics = {}
--      for i, line in ipairs(params.content) do
--        local col, end_col = string.find(line, "#")
--        if col and end_col then
--          table.insert(diagnostics, {
--            row = i,
--            col = col,
--            end_col = end_col,
--            source = "spot-comment",
--            message = "I see you! :-)",
--            severity = h.diagnostics.severities["error"]
--          })
--        end
--      end
--      return diagnostics
--    end,
--  }
--}
--null_ls.register(spot_comment)

-- java language server
local root_pattern = lspconfig.util.root_pattern
lspconfig.jdtls.setup {
  root_dir = root_pattern(".git"),
  on_attach = on_attach_highlight,
  cmd = { "jdtls" },
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
local luadev = require("lua-dev").setup {
  library = {
    vimruntime = true, -- runtime path
    types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
    plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
  },
  -- pass any additional options that will be merged in the final lsp config
  lspconfig = {
    cmd = { "lua-language-server" },
    on_attach = on_attach,
    capabilities = capabilities
  },
}

local concat = function(file)
  local dictionary = {}
  for line in io.lines(file) do
    table.insert(dictionary, line)
  end
  return dictionary
end
lspconfig.ltex.setup {
  on_attach = on_attach,
  settings = {
    ltex = {
         additionalRules = {
           languageModel = '~/ngrams/',
           enablePickyRules = true,
         },
         dictionary={["en"] = concat("/home/knj/.config/nvim/spell/dictionary.txt")},
    },
  },
}


--lspconfig.pylsp.setup({
--   settings = {
--      pylsp = {
--         configurationSources = {"flake8"},
--         plugins = {
--            jedi_completion = {
--               include_params = true  -- this line enables snippets
--            },
--         },
--      },
--   },
--   on_attach = on_attach,
--   capabilities = capabilities,
--})
--
