require("nvim-treesitter.configs").setup {
  --ignore_install = {"latex"},
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {"latex"},
  },
  rainbow = {
    enable = true,
    extended_mode = true,
  },
}
