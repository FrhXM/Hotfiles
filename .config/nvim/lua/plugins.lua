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
    use 'mattn/emmet-vim'
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
       }
end)
