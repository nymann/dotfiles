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


-- Lexplore toggle function
ToggleNetrw = function()
  if vim.g.NetrwIsOpen == 1 then
    local i = vim.api.nvim_get_current_buf()
    while i >= 1 do
      if vim.bo.filetype == "netrw" then
        vim.cmd([[ silent exe "bwipeout " . ]] .. i )
      end
      i = i - 1
    end
    vim.g.NetrwIsOpen = 0
    vim.g.netrw_liststyle = 0
    vim.g.netrw_chgwin = -1
  else
    vim.g.NetrwIsOpen = 1
    vim.g.netrw_liststyle = 3
    vim.cmd([[silent Lexplore]])
  end
end

-- Function to open preview of file under netrw
vim.api.nvim_exec([[
  augroup Netrw
    autocmd!
    autocmd filetype netrw nmap <leader>; <cr>:wincmd W<cr>
  augroup end
]], false)

vim.api.nvim_exec([[
  augroup BufferCD
    autocmd!
    autocmd BufEnter * silent! Glcd 
  augroup end
]], false)

vim.api.nvim_exec([[
  augroup nvim-luadev
    autocmd!
    function! SetLuaDevOptions()
      nmap <buffer> <C-c><C-c> <Plug>(Luadev-RunLine)
      vmap <buffer> <C-c><C-c> <Plug>(Luadev-Run)
      nmap <buffer> <C-c><C-k> <Plug>(Luadev-RunWord)
      map  <buffer> <C-x><C-p> <Plug>(Luadev-Complete)
      set filetype=lua
    endfunction
    autocmd BufEnter \[nvim-lua\] call SetLuaDevOptions()
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
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = false
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

require('binds')
