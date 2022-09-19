local cmd = vim.cmd

cmd("packadd packer.nvim")

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use {
    'ray-x/navigator.lua',
    requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}
  }
  use {
    "editorconfig/editorconfig-vim",
  }
  use {
    "lilydjwg/colorizer",
  }
  use {
    "hrsh7th/nvim-cmp"
  }
  use {
    "hrsh7th/cmp-nvim-lsp"
  }
  use {
    "hrsh7th/cmp-vsnip"
  }
  use {
    "hrsh7th/vim-vsnip"
  }
  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  }
  use {
    "weirongxu/plantuml-previewer.vim",
    requires = {
      "tyru/open-browser.vim",
    },
  }
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = [[require("plugins.config.treesitter")]]
  }
  use {
    "nvim-treesitter/playground",
    run = ":TSInstall query",
    config = [[require("plugins.config.playground")]],
  }
  use {
    "ray-x/lsp_signature.nvim",
  }
  use {"ludovicchabant/vim-gutentags"}
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = [[require("plugins.config.telescope")]],
  }
  use {
    "hoob3rt/lualine.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
    config = [[require("plugins.config.lualine")]],
  }
  use {
    "folke/trouble.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      config = [[require("plugins.config.devicons")]],
    },
    config = [[require("plugins.config.lsptrouble")]],
  }
  use {
    "folke/lua-dev.nvim"
  }
  use {
    "folke/tokyonight.nvim",
    config = [[require("plugins.config.tokyonight")]]
  }
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && yarn install",
    cmd = "MarkdownPreview",
    ft = "markdown",
  }
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons",
      config = [[require("plugins.config.devicons")]],
    },
    config = [[require("plugins.config.nvim_tree")]],
  }
  use {
    "romgrk/barbar.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      config = [[require("plugins.config.devicons")]],
    },
  }
  use {
    "lervag/vimtex",
    config = [[require("plugins.config.vimtex")]]
  }
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"},
    },
    config = [[require("plugins.config.refactoring")]],
  }
  use {
    "nymann/nvim-lspconfig",
    config = [[require("plugins.config.lsp")]],
  }
  use {
    "andythigpen/nvim-coverage",
    config = [[require("plugins.config.coverage")]]
  }
end)
