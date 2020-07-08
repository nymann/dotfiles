fun! MakePydoc()
    " For python2 projects.
    "let first_line = getline(1)
    "if first_line !~ '#'
        "call append(0, '# -*- coding: utf-8 -*-')
    "endif

    let second_line = getline(2)
    if second_line !~ '"""'
        call append(1, '"""Example Google style docstrings.')
        call append(2, '')
        call append(3, '"""')
    endif
    exe "w"
    exe "!doq -f % --formatter google -w"
    exe "e"
endfun
