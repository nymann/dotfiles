au BufNewFile,BufRead *.py
            \ set foldmethod=indent

autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
let g:formatter_yapf_style = 'google'
let g:formatters_python = ['yapf']
au BufWrite *.py :Autoformat



autocmd FileType python setlocal makeprg=pylint\ $HOME/.pylintrc\ --output-format=parseable 
autocmd BufWritePost *.py silent make! <afile> | silent  redraw!
autocmd QuickFixCmdPost [^l]* cwindow

