" Svelte
au BufNewFile,BufRead *.svelte set syntax=html

" PGN
au BufNewFile,BufRead *.pgn set syntax=pgn

" Calcurse files
au BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
au BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown

" Fix auto-indentation for YAML files
augroup yaml_fix
    autocmd!
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
augroup END
