local status, packer = pcall(require, "packer")
if (not status) then
	print('Packer is not installed')
	return
end

packer.startup(function(use)
    -- let packer manage itself
    use 'wbthomason/packer.nvim'

    -- utility
    use 'nvim-lua/plenary.nvim' -- util library needed for further implementations

    -- theme used for neovim
    use {
	    'svrana/neosolarized.nvim',
	    requires = { 'tjdevries/colorbuddy.nvim' }
    }

    -- a statusline plugin
    use 'nvim-lualine/lualine.nvim'

    -- bufferline (aka Tab-View if multiple files are open)
    use 'kyazdani42/nvim-web-devicons'
    use 'akinsho/nvim-bufferline.lua'

    -- telescope fuzzy search & file explorer
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

    -- misc plugins for comfort
    use 'norcalli/nvim-colorizer.lua'   -- shows colors codes in files as their actual color
    use 'windwp/nvim-autopairs'         -- automatically places the closing pair
    use 'windwp/nvim-ts-autotag'        -- treesitter supported tag renaming (rename both xml tags at once)

    -- treesitter highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate' -- comment out for initial install since it is a command that is implemented by treesitter itself
    }

    -- LSP and all the really nice goods
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
end)