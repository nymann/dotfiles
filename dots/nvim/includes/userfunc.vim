fun! MakePydoc()
    let first_line = getline(1)
    if first_line !~ '"""'
        call append(1, '"""Example Google style docstrings.')
        call append(2, '')
        call append(3, '"""')
    endif
    exe "w"
    exe "!doq -f % --formatter google -w"
    exe "e"
endfun
