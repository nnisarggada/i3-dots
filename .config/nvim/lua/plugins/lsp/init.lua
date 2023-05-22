return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("plugins.lsp.handlers").setup()
  end,
  dependencies = {
    -- {
    --   "j-hui/fidget.nvim",
    --   config = function()
    --     require("fidget").setup {
    --       sources = { -- Sources to configure
    --         jdtls = { -- Name of source
    --           ignore = true, -- Ignore notifications from this source
    --         },
    --       },
    --     }
    --   end,
    -- },
    {
      "williamboman/mason.nvim",
      cmd = {
        "Mason",
        "MasonInstall",
        "MasonUninstall",
        "MasonUninstallAll",
        "MasonLog",
      }, -- Package Manager
      dependencies = "williamboman/mason-lspconfig.nvim",
      config = function()
        local mason = require "mason"
        local mason_lspconfig = require "mason-lspconfig"
        local lspconfig = require "lspconfig"

        require("lspconfig.ui.windows").default_options.border = "rounded"

        local servers = {
          -- "jsonls",
          "sumneko_lua",
          "clangd",
          -- "intelephense",
          -- "cssls",
          -- "html",
          -- "tsserver",
          -- "emmet_ls",
          "pyright",
          -- "omnisharp",
          -- "yamlls",
          -- "gopls",
          -- "lemminx",
          "vimls",
          -- "cmake",
          -- "powershell_es",
        }

        mason.setup {
          ui = {
            border = "single",
            icons = {
              package_installed = "✓",
              package_pending = "",
              package_uninstalled = "➜",
            },
          },
        }

        mason_lspconfig.setup {
          ensure_installed = servers,
        }

        mason_lspconfig.setup_handlers {
          function(server_name)
            if server_name ~= "jdtls" then
              local opts = {
                on_attach = require("plugins.lsp.handlers").on_attach,
                capabilities = require("plugins.lsp.handlers").capabilities,
              }

              local require_ok, server = pcall(require, "plugins.lsp.settings." .. server_name)
              if require_ok then
                opts = vim.tbl_deep_extend("force", server, opts)
              end

              lspconfig[server_name].setup(opts)
            end
          end,
        }
      end,
    },
  },
}
