set nocompatible
syntax on
set shell=zsh
set encoding=UTF-8
set number
set relativenumber
set cursorline
set wrap
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set mouse=a
set clipboard=unnamedplus
set history=1000
set ruler
set rulerformat=%27(%{strftime('%a\ %e,\ %H:%M')}\ %5l,%-1(%c%V%)\ %P%)
set splitbelow splitright
set smarttab
set backspace=indent,eol,start
set incsearch
set autoread
set complete-=i
set showmatch
set colorcolumn=80,120
set ffs=unix,dos
set t_Co=256
set signcolumn=yes
set cmdheight=1
set hidden
set shortmess+=c
set conceallevel=3
set termguicolors

" Colorschemes
" seoul256 (dark):
" Range: 233 (darkest) ~ 239 (lightest)
" Default: 237
let g:seoul256_background = 235
colo seoul256

if exists('+clipboard')
  set clipboard=unnamedplus  " Yanks go to the ctrl-c '+' clipboard register
endif


