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
        -- Appearances
    use 'tiagovla/tokyodark.nvim' 
    use 'nvim-lualine/lualine.nvim'
    use 'xiyaowong/nvim-transparent'
    use 'kyazdani42/nvim-web-devicons'
    use "lukas-reineke/indent-blankline.nvim"
    	-- Tools
    use 'kyazdani42/nvim-tree.lua' 
    use 'glepnir/dashboard-nvim'
    use {'akinsho/bufferline.nvim', tag = "v2.*"}
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0',
          requires = { {'nvim-lua/plenary.nvim'} }
        }
	-- Programming
    use 'terrortylor/nvim-comment'
    use 'Pocco81/AutoSave.nvim'
    use 'windwp/nvim-autopairs'
    use 'norcalli/nvim-colorizer.lua'

if packer_bootstrap then
    require('packer').sync()
  end
end)


