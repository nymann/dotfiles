set wildmenu
set wildmode=longest,list,full
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX artifacts
set wildignore+=*.jpg,*.bmp,*.png,*.jpeg,*.gif   " Binary images
set wildignore+=*.0,*.onj,*.exe,*.dll,*.manifest " Object files
set wildignore+=*.sw?,*.swap                     " Vim swap files
set wildignore+=*.DS_Store                       " OSX
set wildignore+=*.package-lock.json              " NPM packages cache
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.mov,*.mp4,*.mkv,*.webm         " Video files
set wildignore+=*/node_modules/*                 " NPM packages
set wildignore+=*.pyc                            " Python cache files
