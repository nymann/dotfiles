"Little header.

call plug#begin()
" LSP
Plug 'neovim/nvim-lsp'
Plug 'haorenW1025/completion-nvim'
Plug 'haorenW1025/diagnostic-nvim'
Plug 'wbthomason/lsp-status.nvim'

" Semshi
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'nvim-treesitter/nvim-treesitter'

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

Plug 'takac/vim-hardtime'

" Indentation
Plug 'Yggdroot/indentLine'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Utility
"Plug 'psliwka/vim-smoothie'
Plug 'junegunn/vim-easy-align'
Plug 'unblevable/quick-scope'
"Plug 'AlphaMycelium/pathfinder.vim'

" Snippets
" Plug 'SirVer/ultisnips'
" Plug 'nymann/vim-snippets'

Plug 'norcalli/nvim-colorizer.lua'

" Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'junegunn/goyo.vim'

" Debugger
"Plug 'puremourning/vimspector'

" Tagbar
"Plug 'liuchengxu/vista.vim'

" Themes
Plug 'arcticicestudio/nord-vim'
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
