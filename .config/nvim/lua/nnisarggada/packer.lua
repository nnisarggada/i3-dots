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

return require('packer').startup(function(use)
    -- packer
    use 'wbthomason/packer.nvim'

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- tokyodark
    use({
        'tiagovla/tokyodark.nvim',
        config = function()
            vim.cmd('colorscheme tokyodark')
        end
    })

    -- transparent
    use 'xiyaowong/transparent.nvim'

    -- treesitter
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

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
        requires = { { 'nvim-tree/nvim-web-devicons' } }
    }

    -- codeium
    use {
        'Exafunction/codeium.vim',
        config = function()
            -- Change '<C-g>' here to any keycode you like.
            vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
            vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end,
                { expr = true, silent = true })
            vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
                { expr = true, silent = true })
            vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
        end
    }

    if packer_bootstrap then
    require('packer').sync()
  end
end)
