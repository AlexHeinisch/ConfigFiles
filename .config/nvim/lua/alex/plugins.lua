-- bootstrapping packer to install it on new systems aswell
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- load packer
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
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- misc plugins for comfort
    use 'norcalli/nvim-colorizer.lua'   -- shows colors codes in files as their actual color
    use 'windwp/nvim-autopairs'         -- automatically places the closing pair

    -- treesitter highlighting
    use {
        'nvim-treesitter/nvim-treesitter'--,
        --run = ':TSUpdate' -- comment out for initial install since it is a command that is implemented by treesitter itself
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

    -- editorconfig to specify indents and such
    use 'editorconfig/editorconfig-vim'

    -- simple comment toggler
    use 'numToStr/Comment.nvim'

    if packer_bootstrap then
        packer.sync()
    end
end)
