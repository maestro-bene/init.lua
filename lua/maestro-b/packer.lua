-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use {
        'wbthomason/packer.nvim'
    }

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		"catppuccin/nvim", as = "catppuccin"
	}

    use {
        'nvim-treesitter/nvim-treesitter', {run  = ':TSUpdate'}, as = "treesitter"
    }
    use {
        'nvim-treesitter/playground'
    }
    use {
        'ThePrimeagen/harpoon'
    }
    use {
        'mbbill/undotree'
    }
    use {
        'tpope/vim-fugitive'
    }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    use {
        "folke/trouble.nvim"
    }
    use {
        "folke/zen-mode.nvim"
    }
    use {
       "nvim-tree/nvim-tree.lua", as = "nvimtree",
       requires = {
           "nvim-tree/nvim-web-devicons"
       }
    }
    use {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-treesitter/nvim-treesitter"}
        }
    }
end)
