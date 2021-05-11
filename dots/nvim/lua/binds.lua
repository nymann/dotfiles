--Add leader shortcuts
vim.api.nvim_set_keymap('n', '<leader>f', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>l', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>t', [[<cmd>lua require('telescope.builtin').tags()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>o', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gp', [[<cmd>lua require('telescope.builtin').git_bcommits()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>wb', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>]], { noremap = true, silent = true})

-- Fugitive shortcuts
vim.api.nvim_set_keymap('n', '<leader>ga', ':Git add %:p<CR><CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gd', ':Gdiff<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ge', ':Gedit<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gr', ':Gread<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gw', ':Gwrite<CR><CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gl', ':silent! Glog<CR>:bot copen<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gm', ':Gmove<Space>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>go', ':Git checkout<Space>', { noremap = true, silent = true})

-- alternative shorcuts without fzf
vim.api.nvim_set_keymap('n', '<leader>,', ':buffer *', { noremap = true})
vim.api.nvim_set_keymap('n', '<leader>.', ':e<space>**/', { noremap = true})
vim.api.nvim_set_keymap('n', '<leader>T', ':tjump *', { noremap = true})

-- Remap number increment to alt
vim.api.nvim_set_keymap('n', '<A-a>', '<C-a>', { noremap = true})
vim.api.nvim_set_keymap('v', '<A-a>', '<C-a>', { noremap = true})
vim.api.nvim_set_keymap('n', '<A-x>', '<C-x>', { noremap = true})
vim.api.nvim_set_keymap('v', '<A-x>', '<C-x>', { noremap = true})

-- n always goes forward
vim.api.nvim_set_keymap('n', 'n', "'Nn'[v:searchforward]", { noremap = true, expr = true})
vim.api.nvim_set_keymap('x', 'n', "'Nn'[v:searchforward]", { noremap = true, expr = true})
vim.api.nvim_set_keymap('o', 'n', "'Nn'[v:searchforward]", { noremap = true, expr = true})
vim.api.nvim_set_keymap('n', 'N', "'nN'[v:searchforward]", { noremap = true, expr = true})
vim.api.nvim_set_keymap('x', 'N', "'nN'[v:searchforward]", { noremap = true, expr = true})
vim.api.nvim_set_keymap('o', 'N', "'nN'[v:searchforward]", { noremap = true, expr = true})

vim.api.nvim_set_keymap('n', '<leader>d', ':lua ToggleNetrw()<cr><paste>', { noremap = true, silent = true })

-- Cycle forward and backward in completion list using tab and s-tab.
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
vim.api.nvim_set_keymap("i" , "<CR>"      , "compe#confirm({ 'keys': '<Plug>delimitMateCR', 'mode': '' })" , { noremap = true , expr = true , silent = true })

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap=true, expr = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", {noremap= true, expr = true, silent = true})

--Add move line shortcuts
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true})
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true})
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true})
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true})
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true})
vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true})

--Remap escape to leave terminal mode
vim.api.nvim_exec([[
  augroup Terminal
    autocmd!
    au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
    au TermOpen * set nonu
  augroup end
]], false)

vim.api.nvim_set_keymap('n', '<F10>', '<cmd>lua ToggleMouse()<cr>', { noremap = true })

-- Y yank until the end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true})

-- Clear white space on empty lines and end of line
vim.api.nvim_set_keymap('n', '<F6>', [[:let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>]], { noremap = true, silent = true})

-- Snippet key mappings
vim.api.nvim_set_keymap('i', '<C-l>', 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>"', {noremap = false, expr = true})
vim.api.nvim_set_keymap('s', '<C-l>', 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>"', {noremap = false, expr = true})

vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>LspTroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>LspTroubleToggle lsp_workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>LspTroubleToggle lsp_document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>LspTroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>LspTroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "gR", "<cmd>LspTrouble lsp_references<cr>",
  {silent = true, noremap = true}
)

