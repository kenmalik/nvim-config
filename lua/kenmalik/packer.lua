-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Colorschemes
    use {
        'rebelot/kanagawa.nvim'
    }
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')

    --  use({
    --	  'projekt0n/github-nvim-theme',
    --	  config = function()
    --		  require('github-theme').setup({
    --			  -- ...
    --		  })
    --
    --		  vim.cmd('colorscheme github_dark_default')
    --	  end
    --  })

    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }

    use('lervag/vimtex')

    use('windwp/nvim-ts-autotag')
    use("rafamadriz/friendly-snippets")
    use('saadparwaiz1/cmp_luasnip')

    -- Cmp
    use "hrsh7th/cmp-nvim-lsp-signature-help"
    use "hrsh7th/cmp-path"

    -- Color hinting
    use 'NvChad/nvim-colorizer.lua'
    use({
        "roobert/tailwindcss-colorizer-cmp.nvim",
    })
end)
