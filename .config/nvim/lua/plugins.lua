-----------------------> Automatic Install Plug <-----------------------------
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

------------------------->  Plugins <-----------------------------------------
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer can manage itself
        -- ColorScheme
    use 'tiagovla/tokyodark.nvim' 
    use 'nvim-lualine/lualine.nvim' 
    use 'xiyaowong/nvim-transparent'
    use 'kyazdani42/nvim-web-devicons' 
    use "lukas-reineke/indent-blankline.nvim"
        -- Tools
    use 'kyazdani42/nvim-tree.lua' 
    use {'akinsho/bufferline.nvim', tag = "v2.*"}
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0',
          requires = { {'nvim-lua/plenary.nvim'} }
        }
        -- Programming
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'mattn/emmet-vim'
    use 'norcalli/nvim-colorizer.lua'
    use 'sheerun/vim-polyglot'
    use 'windwp/nvim-autopairs'
        -- AutoComplete
  if packer_bootstrap then
    require('packer').sync()
  end
end)

