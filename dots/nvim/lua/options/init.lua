local g = vim.g
local o = vim.o
local wo = vim.wo
local cmd = vim.cmd

g.coq_settings = {
  ["auto_start"] = 'shut-up',
  ["keymap.recommended"] = false,
  ["keymap.jump_to_mark"] = "<c-n>",
  ["keymap.bigger_preview"] = "<c-b>",
  ["clients.buffers.enabled"] = false,
  ["clients.snippets.enabled"] = false,
  ["clients.tmux.enabled"] = false,
  ["clients.tags.enabled"] = false,
  ["clients.tree_sitter.enabled"] = false,
  ["clients.lsp.resolve_timeout"] = 0.100,
  ["limits.completion_manual_timeout"] = 0.150,
  ["display.preview.positions.south"] = nil,
}


WriteServerName = function()
  local file = assert(io.open("/tmp/current_nvim_servername", "w"))
  local servername = vim.v.servername;
  file:write(servername .. "\n");
  file:close()
end

cmd([[
  augroup vimtex_common
    autocmd!
    autocmd FileType tex lua WriteServerName()
]], false)

cmd([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.java FormatWrite
  augroup end
]], true)

cmd([[
  augroup BlackFormat
    autocmd!
    autocmd BufWritePost *.py silent !black --quiet % && isort
    autocmd BufWritePost *.py redraw!
  augroup end
]], true)

--Incremental live completion
o.inccommand = "nosplit"

--Set highlight on search
o.hlsearch = false

--Make line numbers relative by default
wo.relativenumber = true

--Do not save when switching buffers
o.hidden = true

--Enable mouse mode
o.mouse = "a"

--Yanks go to ctrl-c '+' clipboard register
o.clipboard = "unnamedplus"

--Enable break indent
o.breakindent = true

--Save undo history
cmd[[ set undofile ]]

--Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true



--Decrease update time
o.updatetime = 250
wo.signcolumn="yes"

-- Set completeopt to have a better completion experience
o.completeopt="menuone,noinsert,noselect"
g.completion_enable_snippet = 'vim-vsnip'

-- Avoid showing message extra message when using completion
o.shortmess = vim.o.shortmess .. "c"


--Add map to enter paste mode
o.pastetoggle="<F3>"

g.indent_blankline_char = "┊"
g.indent_blankline_filetype_exclude = { 'help', 'packer' }
g.indent_blankline_buftype_exclude = { 'terminal', 'nofile'}
g.indent_blankline_char_highlight = 'LineNr'

-- remove conceal on markdown files
g.markdown_syntax_conceal = 0

-- Change preview window location
g.splitbelow = true

-- Neovim python support
g.loaded_python_provider = 0

-- Vim polyglot language specific settings
g.python_highlight_space_errors = 0

-- vim.cmd([[ autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]])

-- Set completeopt to have a better completion experience
o.completeopt="menuone,noinsert,noselect"

local bufferline = {
	icons = true,
	animation = true,
	semantic_letters = true,
	clickable = false,
	letters = 'asdfjkl;ghnmxcbziowerutyqpASDFJKLGHNMXCBZIOWERUTYQP',
  maximum_padding = 4,
}

g.bufferline = bufferline

o.swapfile = false
o.smarttab = true
o.expandtab = true
o.termguicolors = true
