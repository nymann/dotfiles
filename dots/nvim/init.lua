-- Install packer
local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
  augroup end
]], false)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {'nvim-treesitter/nvim-treesitter',run=':TSUpdate'}
  use 'tpope/vim-vinegar'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  -- use 'tpope/vim-surround'
  -- use 'tpope/vim-commentary'
  -- use 'tpope/vim-repeat'
  use 'justinmk/vim-dirvish'
  use 'christoomey/vim-tmux-navigator'
  use 'ludovicchabant/vim-gutentags'
  use {'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use 'joshdick/onedark.vim'
  use 'itchyny/lightline.vim'
  -- use { 'lukas-reineke/indent-blankline.nvim', branch="lua" }
  use 'hkupty/iron.nvim.git'
  use 'lewis6991/gitsigns.nvim'
  use 'neovim/nvim-lspconfig'
  use 'bfredl/nvim-luadev'
  use 'tbastos/vim-lua'
  use 'LnL7/vim-nix'
  use 'ziglang/zig.vim'
  use 'nvim-lua/completion-nvim'
  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    cmd = 'MarkdownPreview',
    ft= {'markdown'}
  }
  use 'junegunn/vim-easy-align'
  use 'mhartington/formatter.nvim'
end)


--Incremental live completion
vim.o.inccommand = "nosplit"


--Set highlight on search
vim.o.hlsearch = false

--Make line numbers relative by default
vim.wo.relativenumber = true

--Do not save when switching buffers
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = "a"

--Yanks go to ctrl-c '+' clipboard register
vim.o.clipboard = "unnamedplus"

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.cmd[[ set undofile ]]

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn="yes"

--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.cmd[[colorscheme onedark]]

--Set statusbar
vim.g.lightline = { colorscheme = 'onedark';
      active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } };
      component_function = { gitbranch = 'fugitive#head', };
}

--Fire, walk with me
vim.cmd[[set guifont="Monaco Nerd Font:h20"]]
vim.g.firenvim_config = { localSettings = { ['.*'] = { takeover = 'never' } } }

--completion-nvim tab as trigger
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})

-- Set completeopt to have a better completion experience
vim.o.completeopt="menuone,noinsert,noselect"

-- Avoid showing message extra message when using completion
vim.o.shortmess = vim.o.shortmess .. "c"

--Remap space as leader key
vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', { noremap = true, silent=true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap=true, expr = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", {noremap= true, expr = true, silent = true})

--Add move line shortcuts
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true})
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true})
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true})
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true})
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true})
vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true})

--Remap escape to leave terminal mode
vim.api.nvim_exec([[
  augroup Terminal
    autocmd!
    au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
    au TermOpen * set nonu
  augroup end
]], false)

--Add map to enter paste mode
vim.o.pastetoggle="<F3>"

vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile'}
vim.g.indent_blankline_char_highlight = 'LineNr'

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

vim.api.nvim_set_keymap('n', '<F10>', '<cmd>lua ToggleMouse()<cr>', { noremap = true })

--Start interactive EasyAlign in visual mode (e.g. vipga)
-- vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {})

--Start interactive EasyAlign for a motion/text object (e.g. gaip)
-- vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', {})

--Add neovim remote for vimtex
-- vim.g.vimtex_compiler_progname = 'nvr'
-- vim.g.tex_flavor = 'latex'

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
--Add leader shortcuts
vim.api.nvim_set_keymap('n', '<leader>f', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>l', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>t', [[<cmd>lua require('telescope.builtin').tags()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>o', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gp', [[<cmd>lua require('telescope.builtin').git_bcommits()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>wb', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>]], { noremap = true, silent = true})

-- Fugitive shortcuts
vim.api.nvim_set_keymap('n', '<leader>ga', ':Git add %:p<CR><CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gd', ':Gdiff<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ge', ':Gedit<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gr', ':Gread<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gw', ':Gwrite<CR><CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gl', ':silent! Glog<CR>:bot copen<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gm', ':Gmove<Space>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>go', ':Git checkout<Space>', { noremap = true, silent = true})

-- alternative shorcuts without fzf
vim.api.nvim_set_keymap('n', '<leader>,', ':buffer *', { noremap = true})
vim.api.nvim_set_keymap('n', '<leader>.', ':e<space>**/', { noremap = true})
vim.api.nvim_set_keymap('n', '<leader>T', ':tjump *', { noremap = true})

-- Make gutentags use ripgrep
-- --python-kinds=-iv
-- --exclude=build
-- --exclude=dist
vim.g.gutentags_file_list_command = 'fd'
vim.g.gutentags_ctags_extra_args = { '--python-kinds=-iv' }

-- remove conceal on markdown files
vim.g.markdown_syntax_conceal = 0

-- Configure vim slime to use tmux
-- vim.g.slime_target = "tmux"
-- vim.g.slime_python_ipython = 1
-- vim.g.slime_dont_ask_default = 1
-- vim.g.slime_default_config = {socket_name = "default", target_pane = "{right-of}"}

-- Change preview window location
vim.g.splitbelow = true

-- Remap number increment to alt
vim.api.nvim_set_keymap('n', '<A-a>', '<C-a>', { noremap = true})
vim.api.nvim_set_keymap('v', '<A-a>', '<C-a>', { noremap = true})
vim.api.nvim_set_keymap('n', '<A-x>', '<C-x>', { noremap = true})
vim.api.nvim_set_keymap('v', '<A-x>', '<C-x>', { noremap = true})

-- n always goes forward
vim.api.nvim_set_keymap('n', 'n', "'Nn'[v:searchforward]", { noremap = true, expr = true})
vim.api.nvim_set_keymap('x', 'n', "'Nn'[v:searchforward]", { noremap = true, expr = true})
vim.api.nvim_set_keymap('o', 'n', "'Nn'[v:searchforward]", { noremap = true, expr = true})
vim.api.nvim_set_keymap('n', 'N', "'nN'[v:searchforward]", { noremap = true, expr = true})
vim.api.nvim_set_keymap('x', 'N', "'nN'[v:searchforward]", { noremap = true, expr = true})
vim.api.nvim_set_keymap('o', 'N', "'nN'[v:searchforward]", { noremap = true, expr = true})

-- Neovim python support
vim.g.loaded_python_provider = 0

-- Highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]], false)

-- Y yank until the end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true})

-- Clear white space on empty lines and end of line
vim.api.nvim_set_keymap('n', '<F6>', [[:let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>]], { noremap = true, silent = true})

-- Nerdtree like sidepanel
-- absolute width of netrw window
vim.g.netrw_winsize = -28

-- do not display info on the top of window
vim.g.netrw_banner = 0

-- sort is affecting only: directories on the top, files below
-- vim.g.netrw_sort_sequence = '[\/]$,*'

-- variable for use by ToggleNetrw function
vim.g.NetrwIsOpen = 0

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

vim.api.nvim_set_keymap('n', '<leader>d', ':lua ToggleNetrw()<cr><paste>', { noremap = true, silent = true })

-- Function to open preview of file under netrw
vim.api.nvim_exec([[
  augroup Netrw
    autocmd!
    autocmd filetype netrw nmap <leader>; <cr>:wincmd W<cr>
  augroup end
]], false)

-- directory managmeent, including autochdir
vim.cmd[[nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>]]

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

-- Vim polyglot language specific settings
vim.g.python_highlight_space_errors = 0

-- vim.cmd([[ autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]])
--
-- LSP settings
-- log file location: ~/.local/share/nvim/lsp.log
-- Add nvim-lspconfig plugin
local nvim_lsp = require('lspconfig')
-- vim.lsp.set_log_level("debug")
local on_attach = function(_client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = true;
      signs = true,
      update_in_insert = false,
    }
  )

  -- completion
  local completion = require('completion')
  completion.on_attach()


  local overridden_hover = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
  vim.lsp.handlers["textDocument/hover"] = function(...)
    local buf = overridden_hover (...)
    vim.api.nvim_buf_set_keymap(buf, 'n', 'K', '<Cmd>wincmd p<CR>', {noremap = true, silent = true})
  end

  -- Mappings.
  local opts = { noremap=true, silent=true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

local servers = {'pyright'}
--local servers = {
--  'gopls', 'clangd', 'vuels', 'hls', 'solargraph', 'rnix', 'ocamllsp',
--  'dartls', 'tsserver', 'solargraph', 'pyright', 'als'
--}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    -- on_attach = completion.on_attach,
    on_attach = on_attach
}
end

nvim_lsp.texlab.setup{
  on_attach = on_attach;
  settings = {
    latex = {
      rootDirectory = ".",
      build = {
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "-pvc" },
        forwardSearchAfter = true,
        onSave = true
      },
      forwardSearch = {
        executable = "zathura",
        args = {"--synctex-forward", "%l:1:%f", "%p"},
        onSave = true
      }
    }
  }
}

-- java language server
nvim_lsp.jdtls.setup {
  cmd = {"jdtls"};
  on_attach = on_attach;
}



local sumneko_cmd
if vim.fn.executable("lua-language-server") == 1 then
  sumneko_cmd = {"lua-language-server"}
else
  local sumneko_root_path = vim.fn.getenv("HOME").."/.local/bin/sumneko_lua"
  sumneko_cmd = {sumneko_root_path.."/bin/macOS/lua-language-server", "-E", sumneko_root_path.."/main.lua" }
end

nvim_lsp.sumneko_lua.setup {
  cmd = sumneko_cmd;
  autostart = false;
  on_attach = on_attach,
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

-- Set completeopt to have a better completion experience
vim.o.completeopt="menuone,noinsert,noselect"

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

--Set tab options for vim
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.smarttab = true
vim.o.expandtab = true --Expand tab to spaces
