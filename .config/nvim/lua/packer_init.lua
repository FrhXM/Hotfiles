-----------------------------------------------------------
-- Bootstrapping
-- Automatically install packer
-----------------------------------------------------------
-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end
------------------------------------------------------------------------------
-- Autocommand that reloads neovim whenever you save the packer_init.lua file
------------------------------------------------------------------------------
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]
-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------
-- Install plugins
return packer.startup(function(use)
  -- Add you plugins here:
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- File explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Indent line
  use 'lukas-reineke/indent-blankline.nvim'

  -- Autopair
  use { 'windwp/nvim-autopairs', config = function()
      require('nvim-autopairs').setup{}
    end
  }

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Tag viewer
  use 'preservim/tagbar'

  -- Color schemes
  use 'xiyaowong/nvim-transparent'
  use 'navarasu/onedark.nvim'
  use 'tiagovla/tokyodark.nvim'
  use 'tanvirtin/monokai.nvim'

  -- Statusline
  use { 'feline-nvim/feline.nvim', requires = { 'kyazdani42/nvim-web-devicons' }, }

  -- Dashboard (start screen)
  use { 'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' }, }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
