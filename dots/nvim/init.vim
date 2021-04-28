"Little header.

call plug#begin()
" LSP
Plug 'neovim/nvim-lsp'
Plug 'haorenW1025/completion-nvim'
Plug 'haorenW1025/diagnostic-nvim'
Plug 'wbthomason/lsp-status.nvim'

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter'

" Comments
Plug 'scrooloose/nerdcommenter'

" Git
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-signify'

" Indentation
Plug 'Yggdroot/indentLine'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Utility
Plug 'junegunn/vim-easy-align'

" Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

" Themes
Plug 'joshdick/onedark.vim'

call plug#end()

luafile ~/.config/nvim/lua/lsp.lua
luafile ~/.config/nvim/lua/tree_sit.lua

so ~/.config/nvim/includes/basic.vim
so ~/.config/nvim/includes/wildmenu.vim
so ~/.config/nvim/includes/backup.vim
so ~/.config/nvim/includes/statusline.vim
so ~/.config/nvim/includes/filetypes.vim
so ~/.config/nvim/includes/plugins.vim
so ~/.config/nvim/includes/userfunc.vim
so ~/.config/nvim/includes/events.vim
so ~/.config/nvim/includes/python.vim
so ~/.config/nvim/includes/syntax/pgn.vim
so ~/.config/nvim/includes/syntax/vcard.vim

so ~/.config/nvim/includes/map.vim
so ~/.config/nvim/includes/lsp.vim
