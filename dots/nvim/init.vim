"Little header.

call plug#begin()
" LSP
Plug 'neovim/nvim-lsp'
Plug 'haorenW1025/completion-nvim'
Plug 'haorenW1025/diagnostic-nvim'
Plug 'wbthomason/lsp-status.nvim'

" Semshi
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" Comments
Plug 'scrooloose/nerdcommenter'
Plug 'Chiel92/vim-autoformat'

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
Plug 'psliwka/vim-smoothie'
Plug 'junegunn/vim-easy-align'
Plug 'unblevable/quick-scope'
Plug 'AlphaMycelium/pathfinder.vim'

" Plug 'SirVer/ultisnips'
Plug 'chrisbra/Colorizer'
Plug 'kien/rainbow_parentheses.vim'

" Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'heavenshell/vim-pydocstring'
Plug 'junegunn/goyo.vim'

" Debugger
Plug 'puremourning/vimspector'

" Tagbar
Plug 'liuchengxu/vista.vim'

" Themes
Plug 'joshdick/onedark.vim'
Plug 'junegunn/seoul256.vim'
Plug 'nymann/vim-snippets'
call plug#end()

luafile ~/.config/nvim/lua/lsp.lua

so ~/.config/nvim/includes/basic.vim
so ~/.config/nvim/includes/wildmenu.vim
so ~/.config/nvim/includes/backup.vim
so ~/.config/nvim/includes/statusline.vim
so ~/.config/nvim/includes/filetypes.vim
so ~/.config/nvim/includes/plugins.vim
so ~/.config/nvim/includes/events.vim
so ~/.config/nvim/includes/python.vim
so ~/.config/nvim/includes/syntax/pgn.vim
so ~/.config/nvim/includes/syntax/vcard.vim

so ~/.config/nvim/includes/lsp.vim
so ~/.config/nvim/includes/map.vim
