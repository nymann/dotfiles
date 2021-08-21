local map = vim.api.nvim_set_keymap
local cmd = vim.cmd
local g = vim.g

local opts = { noremap=true, silent=true }
--Remap space as leader key
map("n", "<Space>", "<Nop>", opts)
g.mapleader = " "
g.maplocalleader = " "

-- Fugitive shortcuts
map('n', '<leader>ga', ':Git add %:p<CR><CR>', opts)
map('n', '<leader>gd', ':Gdiff<CR>', opts)
map('n', '<leader>ge', ':Gedit<CR>', opts)
map('n', '<leader>gr', ':Gread<CR>', opts)
map('n', '<leader>gw', ':Gwrite<CR><CR>', opts)
map('n', '<leader>gl', ':silent! Glog<CR>:bot copen<CR>', opts)
map('n', '<leader>gm', ':Gmove<Space>', opts)
map('n', '<leader>go', ':Git checkout<Space>', opts)

-- Cycle forward and backward in completion list using tab and s-tab.
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map("i" , "<CR>"      , "compe#confirm({ 'keys': '<Plug>delimitMateCR', 'mode': '' })" , { noremap = true , expr = true , silent = true })

--Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap=true, expr = true, silent = true})
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", {noremap= true, expr = true, silent = true})

--Add move line shortcuts
map('n', '<A-j>', ':m .+1<CR>==', { noremap = true})
map('n', '<A-k>', ':m .-2<CR>==', { noremap = true})
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true})
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true})
map('v', '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true})
map('v', '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true})

--Remap escape to leave terminal mode
cmd([[
  augroup Terminal
    autocmd!
    au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
    au TermOpen * set nonu
  augroup end
]], false)

map('n', '<F10>', '<cmd>lua ToggleMouse()<cr>', { noremap = true })

-- Y yank until the end of line
map('n', 'Y', 'y$', { noremap = true})

-- Clear white space on empty lines and end of line
map('n', '<F6>', [[:let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>]], opts)

-- Snippet key mappings
map('i', '<C-s>', 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>"', {noremap = false, expr = true})
map('s', '<C-s>', 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>"', {noremap = false, expr = true})

map('n', '<F2>', 'K', opts)

-- LSP Trouble bindings
map("n", "<leader>xx", "<cmd>LspTroubleToggle<cr>", opts)
map("n", "<leader>xw", "<cmd>LspTroubleToggle lsp_workspace_diagnostics<cr>", opts)
map("n", "<leader>xd", "<cmd>LspTroubleToggle lsp_document_diagnostics<cr>", opts)
map("n", "<leader>xl", "<cmd>LspTroubleToggle loclist<cr>", opts)
map("n", "<leader>xq", "<cmd>LspTroubleToggle quickfix<cr>", opts)
map("n", "gR", "<cmd>LspTrouble lsp_references<cr>", opts)

-- tree-nvim
map("n", "<leader>d", "<cmd>NvimTreeToggle<CR>", {noremap = true})

-- LSP Mappings.
map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
map('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

-- create splits
map('n', '<leader>,', '<cmd>vsplit<CR>', opts)
map('n', '<leader>.', '<cmd>split<CR>', opts)

-- navigate splits
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Buffer shenanigans
map("n", "<leader>bf", ":BufferPick<CR>", opts)
map("n", "<leader>bd", ":BufferClose<CR>", opts)

-- telescope
map("n", "<leader>f", [[<cmd>lua require("telescope.builtin").find_files()<cr>]], opts)
map("n", "<leader><space>", [[<cmd>lua require("telescope.builtin").buffers()<cr>]], opts)
map("n", "<leader>l", [[<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>]], opts)
map("n", "<leader>t", [[<cmd>lua require("telescope.builtin").tags()<cr>]], opts)
map("n", "<leader>?", [[<cmd>lua require("telescope.builtin").oldfiles()<cr>]], opts)
map("n", "<leader>sd", [[<cmd>lua require("telescope.builtin").grep_string()<cr>]], opts)
map("n", "<leader>sp", [[<cmd>lua require("telescope.builtin").live_grep()<cr>]], opts)
map("n", "<leader>o", [[<cmd>lua require("telescope.builtin").tags{ only_current_buffer = true }<cr>]], opts)
map("n", "<leader>gc", [[<cmd>lua require("telescope.builtin").git_commits()<cr>]], opts)
map("n", "<leader>gb", [[<cmd>lua require("telescope.builtin").git_branches()<cr>]], opts)
map("n", "<leader>gs", [[<cmd>lua require("telescope.builtin").git_status()<cr>]], opts)
map("n", "<leader>gp", [[<cmd>lua require("telescope.builtin").git_bcommits()<cr>]], opts)
map("n", "<leader>wb", [[<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>]], opts)
