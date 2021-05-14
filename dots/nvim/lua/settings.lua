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
g.gutentags_file_list_command = 'fd'
g.gutentags_ctags_extra_args = { '--python-kinds=-iv' }

-- remove conceal on markdown files
g.markdown_syntax_conceal = 0

-- Change preview window location
g.splitbelow = true

-- Neovim python support
g.loaded_python_provider = 0

-- Vim polyglot language specific settings
g.python_highlight_space_errors = 0

-- vim.cmd([[ autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]])

-- Set completeopt to have a better completion experience
vim.o.completeopt="menuone,noinsert,noselect"

-- nvim tree
g.nvim_tree_side = "left"
g.nvim_tree_width = 35
g.nvim_tree_ignore = {".git", "node_modules", ".cache", "__pycache__"}
g.nvim_tree_auto_open = 0
g.nvim_tree_auto_close = 0
g.nvim_tree_quit_on_open = 0
g.nvim_tree_follow = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_gitignore = 1
g.nvim_tree_root_folder_modifier = ":~"
g.nvim_tree_allow_resize = 1
g.nvim_tree_lsp_diagnostics = 1

g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1
}

g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git  = {
      unstaged = "",
      staged = "✓",
      unmerged = "",
      renamed = "",
      untracked = "",
      deleted = "",
      ignored = ""
      },
    folder  = {
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
      symlink_open = "",
      },
      lsp  = {
        hint = "",
        info = "",
        warning = "",
        error = "",
        }
}


local bufferline = {
	icons = true,
	animation = true,
	semantic_letters = true,
	clickable = false,
	letters = 'asdfjkl;ghnmxcbziowerutyqpASDFJKLGHNMXCBZIOWERUTYQP',
  maximum_padding = 4,
}

g.bufferline = bufferline


o.swapfile = false
o.smarttab = true
o.expandtab = true
o.termguicolors = true

-- vimtex
g.vimtex_view_method = 'zathura'
g.vimtex_format_enabled = 1
g.vimtex_compiler_latexmk = '-pdf -pvc -lualatex -shell-escape -verbose -file-line-error -synctex=1 -interaction=nonstopmode'
