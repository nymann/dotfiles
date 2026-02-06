local fn = vim.fn
local cmd = vim.cmd

-- Automatically install Packer if it's not already installed
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

require('mappings')
require('options')
require('plugins')

-- Auto-compile packer if compiled file is missing
local compile_path = fn.stdpath('config') .. '/plugin/packer_compiled.lua'
if fn.empty(fn.glob(compile_path)) > 0 then
  require('packer').compile()
end
