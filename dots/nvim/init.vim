call plug#begin()
    " Functionality
	Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ryanoasis/vim-devicons'
    Plug 'airblade/vim-gitgutter'
    Plug 'scrooloose/nerdcommenter'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'vim-syntastic/syntastic'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
    Plug 'SirVer/ultisnips'
    Plug 'nymann/vim-snippets'

    " MARKDOWN (https://jdhao.github.io/2019/01/15/markdown_edit_preview_nvim/)
    " Previewing
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

    " PYTHON (https://www.vimfromscratch.com/articles/vim-for-python/)
    " Syntax highlighter
    Plug 'numirias/semshi'
    " Indentation
    Plug 'Vimjas/vim-python-pep8-indent'
    " Linting & Fixing
    Plug 'dense-analysis/ale'

    " Tag bar
    Plug 'liuchengxu/vista.vim'

    " Appearance
    Plug 'junegunn/goyo.vim'
    Plug 'bling/vim-airline'
    Plug 'kien/rainbow_parentheses.vim'
    Plug 'gko/vim-coloresque'

    " Themes
    Plug 'joshdick/onedark.vim'
    Plug 'junegunn/seoul256.vim'
call plug#end()

so ~/.config/nvim/includes/basic.vim
so ~/.config/nvim/includes/wildmenu.vim
so ~/.config/nvim/includes/backup.vim
so ~/.config/nvim/includes/map.vim
so ~/.config/nvim/includes/filetypes.vim
so ~/.config/nvim/includes/plugins.vim
so ~/.config/nvim/includes/events.vim
so ~/.config/nvim/includes/python.vim
so ~/.config/nvim/includes/syntax/pgn.vim
so ~/.config/nvim/includes/syntax/vcard.vim
