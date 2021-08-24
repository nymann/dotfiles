-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/knj/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/knj/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/knj/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/knj/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/knj/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["coq.artifacts"] = {
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/coq.artifacts"
  },
  coq_nvim = {
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/coq_nvim"
  },
  delimitMate = {
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/delimitMate"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { 'require("plugins.config.gitsigns")' },
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/gv.vim"
  },
  ["iron.nvim"] = {
    config = { 'require("plugins.config.iron")' },
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/iron.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    config = { 'require("plugins.config.lualine")' },
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    path = "/home/knj/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  ["nvim-autopairs"] = {
    config = { 'require("plugins.config.autopairs")' },
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-lspconfig"] = {
    config = { 'require("plugins.config.lsp")' },
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { 'require("plugins.config.nvim_tree")' },
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { 'require("plugins.config.treesitter")' },
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/knj/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["refactoring.nvim"] = {
    config = { 'require("plugins.config.refactoring")' },
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/refactoring.nvim"
  },
  ["spellsitter.nvim"] = {
    config = { 'require("plugins.config.spellsitter")' },
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/spellsitter.nvim"
  },
  ["telescope.nvim"] = {
    config = { 'require("plugins.config.telescope")' },
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { 'require("plugins.config.tokyonight")' },
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { 'require("plugins.config.lsptrouble")' },
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gutentags"] = {
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/vim-gutentags"
  },
  vimtex = {
    config = { 'require("plugins.config.vimtex")' },
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/vimtex"
  },
  ["which-key.nvim"] = {
    config = { 'require("plugins.config.which_key")' },
    loaded = true,
    path = "/home/knj/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
require("plugins.config.tokyonight")
time([[Config for tokyonight.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require("plugins.config.gitsigns")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require("plugins.config.lsp")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require("plugins.config.nvim_tree")
time([[Config for nvim-tree.lua]], false)
-- Config for: iron.nvim
time([[Config for iron.nvim]], true)
require("plugins.config.iron")
time([[Config for iron.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require("plugins.config.treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require("plugins.config.lualine")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require("plugins.config.autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
require("plugins.config.lsptrouble")
time([[Config for trouble.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
require("plugins.config.which_key")
time([[Config for which-key.nvim]], false)
-- Config for: spellsitter.nvim
time([[Config for spellsitter.nvim]], true)
require("plugins.config.spellsitter")
time([[Config for spellsitter.nvim]], false)
-- Config for: vimtex
time([[Config for vimtex]], true)
require("plugins.config.vimtex")
time([[Config for vimtex]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require("plugins.config.telescope")
time([[Config for telescope.nvim]], false)
-- Config for: refactoring.nvim
time([[Config for refactoring.nvim]], true)
require("plugins.config.refactoring")
time([[Config for refactoring.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
