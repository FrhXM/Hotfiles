return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer can manage itself
        -- ColorScheme
    use 'tiagovla/tokyodark.nvim' 
    use 'nvim-lualine/lualine.nvim' 
    use 'kyazdani42/nvim-web-devicons' 
    use "lukas-reineke/indent-blankline.nvim"
        -- Tools
    use 'kyazdani42/nvim-tree.lua' 
    use {
          'nvim-telescope/telescope.nvim', tag = '0.1.0',
          requires = { {'nvim-lua/plenary.nvim'} }
        }
        -- Programming
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'mattn/emmet-vim'
    use 'sheerun/vim-polyglot'
    use 'windwp/nvim-autopairs'
end)


