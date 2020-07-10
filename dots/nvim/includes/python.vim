autocmd FileType python map <buffer> <C-F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <C-F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
let g:formatter_yapf_style = 'google'
let g:formatters_python = ['yapf']
au BufWrite *.py :Autoformat
