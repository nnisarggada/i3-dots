-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- packer
  use 'wbthomason/packer.nvim'

  -- telescope
  use {
	  'nvim-telescope/telescope.nvim',
	  requires = {{ 'nvim-lua/plenary.nvim' }}
  }

  -- tokyodark
  use ({
	  'tiagovla/tokyodark.nvim',
	  config = function()
		  vim.cmd('colorscheme tokyodark')
	  end
  })

  -- transparent
  use 'xiyaowong/transparent.nvim'

  -- treesitter
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- harpoon
  use 'theprimeagen/harpoon'

  -- undotree
  use 'mbbill/undotree'

  -- lsp-zero
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  { 'neovim/nvim-lspconfig' },
		  { 'williamboman/mason.nvim' },
		  { 'williamboman/mason-lspconfig.nvim' },
		  { 'hrsh7th/nvim-cmp' },
		  { 'hrsh7th/cmp-nvim-lsp' },
		  { 'hrsh7th/cmp-buffer' },
		  { 'hrsh7th/cmp-path' },
		  { 'saadparwaiz1/cmp_luasnip' },
		  { 'hrsh7th/cmp-nvim-lua' },
		  { 'L3MON4D3/LuaSnip' },
		  { 'rafamadriz/friendly-snippets' },
	  }
  }

  -- nvim-tree
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {{ 'nvim-tree/nvim-web-devicons' }}
  }

end)
