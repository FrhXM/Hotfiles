local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " " -- leader key

--> nvim tree mappings <--
map("n", "t", ":NvimTreeToggle<CR>", opts)
map("n", "tf", ":NvimTreeFindFile<CR>", opts)

--> telescope mappings <--
map("n", "ff", ":Telescope find_files<cr>", opts)
map("n", "fg", ":Telescope live_grep<cr>", opts)
map("n", "fb", ":Telescope buffers<cr>", opts)
