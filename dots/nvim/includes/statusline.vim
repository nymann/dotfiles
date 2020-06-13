scriptencoding utf-8
set noshowmode
set laststatus=2
function! UpdateColors(mode) abort
    " Normal mode
    if a:mode ==# 'n'
        hi StatuslineAccent guibg=#009999 gui=bold guifg=#F0F0F0
        " Insert mode
    elseif a:mode ==# 'i'
        hi StatuslineAccent guifg=#F0F0F0 gui=bold guibg=#dab997
        " Replace mode
    elseif a:mode ==# 'R'
        hi StatuslineAccent guifg=#F0F0F0 gui=bold guibg=#FFC800
        " Command mode
    elseif a:mode ==# 'c'
        hi StatuslineAccent guifg=#F0F0F0 gui=bold guibg=#83adad
        " Terminal mode
    elseif a:mode ==# 't'
        hi StatuslineAccent guifg=#F0F0F0 gui=bold guibg=#6f6f6f
        " Visual mode
    else
        hi StatuslineAccent guifg=#F0F0F0 gui=bold guibg=#f485dd
    endif

    if &modified
        hi StatuslineFilename guifg=#F62447 gui=bold guibg=#323232
    else
        hi StatuslineFilename guifg=#F0F0F0 gui=bold guibg=#323232
    endif
    " Return empty string so as not to display anything in the statusline
    return ''
endfunction

function! SetModifiedSymbol(modified) abort
    if a:modified == 1
        hi StatuslineModified guibg=#323232 gui=bold guifg=#F62447
        return '  ●'
    else
        hi StatuslineModified guibg=#323232 gui=bold guifg=#FFC800
        return ''
    endif
endfunction

set statusline=%{UpdateColors(mode())}

" Left side items
set statusline+=%#StatuslineAccent#\ %{statusline#get_mode(mode())}\ 

" Filetype icon
set statusline+=%#StatuslineFiletype#\ %{statusline#icon()}

" Modified status
set statusline+=%#StatuslineModified#%{SetModifiedSymbol(&modified)}

" Filename
set statusline+=%#StatuslineFilename#\ %{statusline#filename()}\ %<

" Paste and RO
set statusline+=%#StatuslineFilename#%{&paste?'PASTE\ ':''}
set statusline+=%{&paste&&&readonly?'\ ':''}%r%{&readonly?'\ ':''}

" Line and Column
set statusline+=%#StatuslineLineCol#(Ln\ %l/%L,\ %#StatuslineLineCol#Col\ %c)\ %<

" Right side items
set statusline+=%=

" VCS
set statusline+=%#StatuslineVC#%{statusline#vc_status()}\

" LSP
set statusline+=%{statusline#have_lsp()?'':'\ '}%(%#StatuslineLint#%{statusline#lsp()}%)%#StatuslineFiletype#
" Setup the colors
function! s:setup_colors() abort
    " hi StatusLine          guifg=#d485ad     guibg=NONE     gui=NONE
    " hi StatusLineNC        guifg=#F62447     guibg=NONE     gui=bold

    hi StatuslineSeparator guifg=#323232 gui=none guibg=none

    hi StatuslineFiletype guifg=#d9d9d9 gui=none guibg=#323232

    hi StatuslinePercentage guibg=#323232 gui=none guifg=#dab997

    hi StatuslineNormal guibg=#009999 gui=none guifg=#F0F0F0
    hi StatuslineVC guibg=#323232 gui=none guifg=#a9a9a9

    hi StatuslineLintWarn guibg=#323232 gui=none guifg=#FFC800
    hi StatuslineLintChecking guibg=#323232 gui=none guifg=#009999
    hi StatuslineLintError guibg=#323232 gui=none guifg=#F62447
    hi StatuslineLintOk guibg=#323232 gui=none guifg=#65C728
    hi StatuslineLint guibg=#F0F0F0 guifg=#323232

    hi StatuslineLineCol guibg=#323232 gui=none guifg=#878787

    hi StatuslineFiletype guibg=#323232 gui=none guifg=#F0F0F0
endfunction

augroup statusline_colors
    au!
    au ColorScheme * call s:setup_colors()
augroup END

call s:setup_colors()
