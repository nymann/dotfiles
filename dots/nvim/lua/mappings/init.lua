local map = vim.api.nvim_set_keymap
local g = vim.g

local opts = { noremap=true, silent=true }
--Remap space as leader key
map("n", "<Space>", "<Nop>", opts)
g.mapleader = " "
g.maplocalleader = " "

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
map('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>', opts)
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('v', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
map('n', '<leader>Q', '<cmd>lua vim.diagnostic.setqflist()<CR>', opts)

-- refactoring.nvim
-- Remaps for the refactoring operations currently offered by the plugin
vim.api.nvim_set_keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

-- Extract block doesn't need visual mode
vim.api.nvim_set_keymap("n", "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]], {noremap = true, silent = true, expr = false})

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.api.nvim_set_keymap("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

-- create splits
map('n', '<leader>,', '<cmd>vsplit<CR>', opts)
map('n', '<leader>.', '<cmd>split<CR>', opts)

-- Buffer shenanigans
map("n", "<leader>bp", ":BufferPick<CR>", opts)
map("n", "<leader>bc", ":BufferClose<CR>", opts)

-- telescope
map("n", "<leader>f", ':Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<CR>', opts)
map("n", "<leader><space>", [[<cmd>lua require("telescope.builtin").buffers()<cr>]], opts)
map("n", "<leader>l", [[<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>]], opts)
map("n", "<leader>ts", [[<cmd>lua require("telescope.builtin").tags()<cr>]], opts)
map("n", "<leader>?", [[<cmd>lua require("telescope.builtin").oldfiles()<cr>]], opts)
map("n", "<leader>sd", [[<cmd>lua require("telescope.builtin").grep_string()<cr>]], opts)
map("n", "<leader>sp", [[<cmd>lua require("telescope.builtin").live_grep()<cr>]], opts)
map("n", "<leader>o", [[<cmd>lua require("telescope.builtin").tags{ only_current_buffer = true }<cr>]], opts)
map("n", "<leader>gc", [[<cmd>lua require("telescope.builtin").git_commits()<cr>]], opts)
map("n", "<leader>gb", [[<cmd>lua require("telescope.builtin").git_branches()<cr>]], opts)
map("n", "<leader>gs", [[<cmd>lua require("telescope.builtin").git_status()<cr>]], opts)
map("n", "<leader>gp", [[<cmd>lua require("telescope.builtin").git_bcommits()<cr>]], opts)
map("n", "<leader>wb", [[<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>]], opts)

map("n", "<leader>cc", "<cmd>CoverageSummary<cr>", opts)
map("n", "vx", ':lua vim.lsp.start({name="refacto", cmd=vim.lsp.rpc.connect("127.0.0.1", 13302)})<CR>', opts)
