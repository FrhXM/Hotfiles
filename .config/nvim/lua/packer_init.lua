local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
print("install_path: " .. install_path)
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    download_result = fn.system({'ls', '-l', install_path})
    print("download_result: " .. download_result)
end

return require("packer").startup(function()
    use("wbthomason/packer.nvim")

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
    use("ryanoasis/vim-devicons")
    use("nvim-tree/nvim-web-devicons")
    use("goolord/alpha-nvim")
    use("feline-nvim/feline.nvim")
    use("norcalli/nvim-colorizer.lua")
    use("lukas-reineke/indent-blankline.nvim")
    use("akinsho/toggleterm.nvim")
    use("windwp/nvim-autopairs")

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
    use("Everblush/everblush.nvim")
    use({ 'tiagovla/tokyodark.nvim',
        config = function()
        vim.cmd("colorscheme tokyodark")
        end })

    -- navigation
    use("kyazdani42/nvim-tree.lua")
    use("nvim-telescope/telescope.nvim")
    use("ggandor/leap.nvim")
    use("akinsho/bufferline.nvim")

 if packer_bootstrap then
   require('packer').sync()
 end
end)

