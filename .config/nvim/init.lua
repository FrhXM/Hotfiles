--[[

Neovim init file
Maintainer: brainf+ck
Website: https://github.com/brainfucksec/neovim-lua

--]]

-- Import Lua modules
require('packer_init')
require('core/options')
require('core/autocmds')
require('core/keymaps')
-- require('lsp/lspconfig')
-- require('plugins/nvim-cmp')
-- require('plugins/nvim-treesitter')
require('plugins/colors')
require('plugins/statusline')
require('plugins/nvim-tree')
require('plugins/nvim-bufferline')
require('plugins/indent-blankline')
require('plugins/alpha-nvim')
require('plugins/others')
