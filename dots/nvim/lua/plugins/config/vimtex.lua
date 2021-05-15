local g = vim.g

g.vimtex_view_method = 'zathura'
g.vimtex_format_enabled = 1
g.vimtex_compiler_latexmk = '-pdf -lualatex -shell-escape -verbose -file-line-error -synctex=1 -interaction=nonstopmode'
