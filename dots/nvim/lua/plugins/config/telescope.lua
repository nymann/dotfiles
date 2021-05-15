-- Telescope
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
    generic_sorter =  require("telescope.sorters").get_fzy_sorter,
    file_sorter =  require("telescope.sorters").get_fzy_sorter,
  }
}

local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }
--Add leader shortcuts
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
