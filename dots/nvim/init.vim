call plug#begin()
" LSP "
Plug 'neovim/nvim-lsp'
Plug 'haorenW1025/completion-nvim'
Plug 'haorenW1025/diagnostic-nvim'
Plug 'wbthomason/lsp-status.nvim'

" Nerd tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'

" Fuzzy finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Formatting
Plug 'Chiel92/vim-autoformat'

" Utility
Plug 'Yggdroot/indentLine'
Plug 'psliwka/vim-smoothie'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'nymann/vim-snippets'

"" MARKDOWN (https://jdhao.github.io/2019/01/15/markdown_edit_preview_nvim/)
"" Previewing
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}


"" PYTHON (https://www.vimfromscratch.com/articles/vim-for-python/)

"" Syntax highlighter
Plug 'numirias/semshi'

"" Linting & Fixing
"Plug 'dense-analysis/ale'
Plug 'heavenshell/vim-pydocstring'

"" Tag bar
Plug 'liuchengxu/vista.vim'

"" Appearance
Plug 'junegunn/goyo.vim'
"Plug 'bling/vim-airline'
Plug 'kien/rainbow_parentheses.vim'
Plug 'gko/vim-coloresque'

" Themes
Plug 'joshdick/onedark.vim'
"Plug 'junegunn/seoul256.vim'
call plug#end()
luafile ~/.config/nvim/lua/lsp.lua

so ~/.config/nvim/includes/basic.vim
so ~/.config/nvim/includes/lsp.vim
so ~/.config/nvim/includes/wildmenu.vim
so ~/.config/nvim/includes/backup.vim
so ~/.config/nvim/includes/map.vim
so ~/.config/nvim/includes/filetypes.vim
so ~/.config/nvim/includes/plugins.vim
so ~/.config/nvim/includes/events.vim
so ~/.config/nvim/includes/python.vim
so ~/.config/nvim/includes/syntax/pgn.vim
so ~/.config/nvim/includes/syntax/vcard.vim

