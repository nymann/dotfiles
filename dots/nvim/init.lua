require('plugin_loader')
require('settings')
require('lsp')

--Set statusbar
require('lualine').setup{
  options = {
    theme = "tokyonight"
  }
}

-- Toggle to disable mouse mode and indentlines for easier paste
ToggleMouse = function()
  if vim.o.mouse == 'a' then
    vim.cmd[[IndentBlanklineDisable]]
    vim.wo.signcolumn='no'
    vim.o.mouse = 'v'
    vim.wo.number = false
    print("Mouse disabled")
  else
    vim.cmd[[IndentBlanklineEnable]]
    vim.wo.signcolumn='yes'
    vim.o.mouse = 'a'
    vim.wo.number = true
    print("Mouse enabled")
  end
end

-- Gitsigns
require('gitsigns').setup({
  signs = {
    add          = {hl = 'GitGutterAdd'   , text = '+'},
    change       = {hl = 'GitGutterChange', text = '~'},
    delete       = {hl = 'GitGutterDelete', text = '_'},
    topdelete    = {hl = 'GitGutterDelete', text = '‾'},
    changedelete = {hl = 'GitGutterChange', text = '~'},
  }
})

-- Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
    generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
  }
}

-- Highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]], false)


require'compe'.setup {
  enabled = true;
  debug = false;
  min_length = 1;
  documentation = true;
  autocomplete = true;
  source = {
  	buffer   = true;
  	calc     = true;
  	nvim_lsp = true;
  	nvim_lua = true;
  	path     = true;
  	spell    = true;
  	vsnip    = true;
  };
}

FormatRange = function()
  local start_pos = vim.api.nvim_buf_get_mark(0, '<')
  local end_pos = vim.api.nvim_buf_get_mark(0, '>')
  vim.lsp.buf.range_formatting({}, start_pos, end_pos)
end

vim.cmd([[
  command! -range FormatRange  execute 'lua FormatRange()'
]])

vim.cmd([[
  command! Format execute 'lua vim.lsp.buf.formatting()'
]])

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  rainbow = {
    enable = true,
    extended_mode = true,
  }
}

-- Formatters
require'formatter'.setup {
  logging = false,
  filetype = {
    java = {
      -- google-java-format
      function()
        return {
          exe = "java",
          args = {"-jar", vim.fn.getenv("HOME").."/.local/share/google-java-format-1.4-all-deps.jar", "-"},
          stdin = true
        }
      end
    }
  }
}

WriteServerName = function()
  local file = assert(io.open("/tmp/current_nvim_servername", "w"))
  local servername = vim.v.servername;
  file:write(servername .. "\n");
  file:close()
end

vim.api.nvim_exec([[
  augroup vimtex_common
    autocmd!
    autocmd FileType tex lua WriteServerName()
]], false)

vim.api.nvim_exec([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.java FormatWrite
  augroup end
]], true)

local iron = require('iron')

iron.core.set_config {
  preferred = {
    python = "ipython",
  }
}

require('spellsitter').setup()

require('binds')
