local g = vim.g
local api = vim.api
local o = vim.o
local wo = vim.wo
local cmd = vim.cmd

--Remap space as leader key
api.nvim_set_keymap('n', '<Space>', '<Nop>', { noremap = true, silent=true})
g.mapleader = " "
g.maplocalleader = " "

--Incremental live completion
o.inccommand = "nosplit"

--Set highlight on search
o.hlsearch = false

--Make line numbers relative by default
wo.relativenumber = true

--Do not save when switching buffers
o.hidden = true

--Enable mouse mode
o.mouse = "a"

--Yanks go to ctrl-c '+' clipboard register
o.clipboard = "unnamedplus"

--Enable break indent
o.breakindent = true

--Save undo history
cmd[[ set undofile ]]

--Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

--Decrease update time
o.updatetime = 250
wo.signcolumn="yes"

--Set colorscheme (order is important here)
g.tokyonight_style ="night"
cmd[[colorscheme tokyonight]]
-- Set completeopt to have a better completion experience
o.completeopt="menuone,noinsert,noselect"
g.completion_enable_snippet = 'vim-vsnip'

-- Avoid showing message extra message when using completion
o.shortmess = vim.o.shortmess .. "c"


--Add map to enter paste mode
o.pastetoggle="<F3>"

g.indent_blankline_char = "┊"
g.indent_blankline_filetype_exclude = { 'help', 'packer' }
g.indent_blankline_buftype_exclude = { 'terminal', 'nofile'}
g.indent_blankline_char_highlight = 'LineNr'


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

-- Nerdtree like sidepanel
-- absolute width of netrw window
vim.g.netrw_winsize = -28

-- do not display info on the top of window
vim.g.netrw_banner = 0

-- sort is affecting only: directories on the top, files below
-- vim.g.netrw_sort_sequence = '[\/]$,*'

-- variable for use by ToggleNetrw function
vim.g.NetrwIsOpen = 0
-- Neovim python support
vim.g.loaded_python_provider = 0

-- directory managmeent, including autochdir
vim.cmd[[nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>]]

-- Vim polyglot language specific settings
vim.g.python_highlight_space_errors = 0

-- vim.cmd([[ autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]])

-- Set completeopt to have a better completion experience
vim.o.completeopt="menuone,noinsert,noselect"
