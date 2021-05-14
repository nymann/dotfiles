-- Install packer local execute = vim.api.nvim_command
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
  augroup end
]], false)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {'nvim-treesitter/nvim-treesitter',run=':TSUpdate'}
  use 'tpope/vim-vinegar'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'justinmk/vim-dirvish'
  use 'christoomey/vim-tmux-navigator'
  use 'ludovicchabant/vim-gutentags'
  use {'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons'}}
  use 'hkupty/iron.nvim.git'
  use 'lewis6991/gitsigns.nvim'
  use 'neovim/nvim-lspconfig'
  use 'bfredl/nvim-luadev'
  use 'tbastos/vim-lua'
  use 'LnL7/vim-nix'
  use 'lervag/vimtex'
  use 'ziglang/zig.vim'
  use { 'hrsh7th/nvim-compe', requires = {'hrsh7th/vim-vsnip', 'hrsh7th/vim-vsnip-integ'} }
  use {
    'folke/lsp-trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require("trouble").setup {}
    end
  }
  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup {}
    end
  }
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    cmd = 'MarkdownPreview',
    ft= {'markdown'}
  }
  use 'folke/tokyonight.nvim'
  use 'Raimondi/delimitMate'
  use 'junegunn/vim-easy-align'
  use 'mhartington/formatter.nvim'
  use 'rafamadriz/friendly-snippets'
  use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}}
  use 'ray-x/lsp_signature.nvim'
  use {'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}}
  use {
    'lewis6991/spellsitter.nvim',
    config = function()
      require('spellsitter').setup()
    end
  }
end)
