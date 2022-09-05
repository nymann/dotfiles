local g = vim.g

g.vimtex_quickfix_mode = 0
g.vimtex_view_forward_search_on_start = 1
g.vimtex_view_general_viewer = "okular"
g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
--g.vimtex_view_general_options_latexmk = "--unique"
g.vimtex_view_method = 'zathura'
--g.vimtex_view_method = 'general'
g.vimtex_format_enabled = 1
g.vimtex_compiler_progname = "nvr"
g.vimtex_compiler_engine = "lualatex"
g.vimtex_complete_recursive_bib = 1
g.vimtex_complete_enabled = 1
g.vimtex_compiler_latexmk = {
  build_dir="",
  callback=1,
  continuous=1,
  executable="latexmk",
  options={
    "-verbose",
    "-file-line-error",
    "-synctex=1",
    "-interaction=nonstopmode",
    "-shell-escape",
  },
}
