local cmd = vim.cmd

cmd("packadd packer.nvim")

return require("packer").startup(function(use)
  use {
    "wbthomason/packer.nvim",
    opt = true,
  }
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = [[require("plugins.config.treesitter")]]
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
    "hkupty/iron.nvim",
    config = [[require("plugins.config.iron")]],
  }
  use {
    "lewis6991/gitsigns.nvim",
    config = [[require("plugins.config.gitsigns")]],
  }
  use {
    "neovim/nvim-lspconfig",
    config = [[require("plugins.config.lsp")]],
  }
  use {
    "hrsh7th/nvim-compe",
    requires = {
      "hrsh7th/vim-vsnip",
      "hrsh7th/vim-vsnip-integ",
    },
    config = [[require("plugins.config.compe")]],
  }
  use {
    "folke/lsp-trouble.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      config = [[require("plugins.config.devicons")]],
    },
    config = [[require("plugins.config.lsptrouble")]],
  }
  use {
    "folke/which-key.nvim",
    config = [[require("plugins.config.which_key")]],
  }
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && yarn install",
    cmd = "MarkdownPreview",
    ft = "markdown",
  }
  use {
    "folke/tokyonight.nvim",
    config = [[require("plugins.config.tokyonight")]]
  }
  use {"Raimondi/delimitMate"}
  use {"junegunn/vim-easy-align"}
  use {"mhartington/formatter.nvim"}
  use {"rafamadriz/friendly-snippets"}
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons",
      config = [[require("plugins.config.devicons")]],
    },
    config = [[require("plugins.config.nvim_tree")]],
  }
  use {
    "ray-x/lsp_signature.nvim"
  }
  use {
    "romgrk/barbar.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      config = [[require("plugins.config.devicons")]],
    },
  }
  use {
    "lewis6991/spellsitter.nvim",
    config = [[require("plugins.config.spellsitter")]],
  }
  use {
    "lervag/vimtex",
    config = [[require("plugins.config.vimtex")]]
  }
end)
