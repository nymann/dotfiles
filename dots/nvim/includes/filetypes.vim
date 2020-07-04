" Svelte
au BufNewFile,BufRead *.svelte set syntax=html

" PGN
au BufNewFile,BufRead *.pgn set syntax=pgn

" Calcurse files
au BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
au BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown


