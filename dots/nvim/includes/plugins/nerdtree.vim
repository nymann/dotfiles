" NERDTree
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
let g:NERDTreeIgnore = [
    \'.inject.summary$',
    \'.inject.dart$',
    \'.g.dart$',
    \'^\.egg-info$',
    \'^.idea',
    \'^__pycache__',
    \'^.git',
    \'^venv'
    \]
let g:NERDTreeShowHidden = 1
