------------------------------------------------------------
-- Plugin manager configuration file			              ----
------------------------------------------------------------
-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

---------------------------------------------------------------
-- Automatically install packer				                      ---
---------------------------------------------------------------
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

---------------------------------------------------------------------------------
-- Autocommand that reloads neovim whenever you save the packer_init.lua file ---
---------------------------------------------------------------------------------
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

---------------------------------------------------------------
--- Use a protected call so we don't error out on first use ---
---------------------------------------------------------------
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

------------------------------------
--- 	Install plugins		----
------------------------------------
return packer.startup(function(use)
  -- Add you plugins here:
  use "wbthomason/packer.nvim" -- packer can manage itself

    -- LSP
    -- use("neovim/nvim-lspconfig")
    -- use("hrsh7th/cmp-nvim-lsp")
    -- use("hrsh7th/cmp-buffer")
    -- use("hrsh7th/cmp-path")
    -- use("hrsh7th/cmp-cmdline")
    -- use("hrsh7th/nvim-cmp")
    -- use("onsails/lspkind-nvim")
    -- use("nvim-lua/lsp_extensions.nvim")
    -- use("glepnir/lspsaga.nvim")
    -- use("simrat39/symbols-outline.nvim")

    -- easier coding
    use("nvim-tree/nvim-web-devicons")
    use("goolord/alpha-nvim")
    use("norcalli/nvim-colorizer.lua")
    use("lukas-reineke/indent-blankline.nvim")
    use("akinsho/toggleterm.nvim")
    use("windwp/nvim-autopairs")
    use('feline-nvim/feline.nvim')


    -- Vim Plugins
    use("tpope/vim-surround")
    use("tpope/vim-commentary")
    use("mattn/emmet-vim")
    use("alvan/vim-closetag")
    use("sheerun/vim-polyglot")

   -- Color theme
    use("xiyaowong/nvim-transparent")
    use("catppuccin/nvim")
    use("folke/tokyonight.nvim")
    use({ 'tiagovla/tokyodark.nvim',
        config = function()
        vim.cmd("colorscheme tokyodark")
        end })

    -- navigation
    use("kyazdani42/nvim-tree.lua")
    use("nvim-telescope/telescope.nvim")
    use("ggandor/leap.nvim")
    use("akinsho/bufferline.nvim")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
