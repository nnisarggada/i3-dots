return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local theme = {
      normal = {
        a = { bg = "#7AA2F7", fg = "#000000" },
        b = { bg = "#3B4261", fg = "#7AA2F7" },
        c = { bg = "NONE", fg = "#A9B1D6" },
      },

      insert = {
        a = { bg = "#98BE65", fg = "#000000" },
        b = { bg = "#3B4261", fg = "#98BE65" },
      },

      command = {
        a = { bg = "#ECBE7B", fg = "#000000" },
        b = { bg = "#3B4261", fg = "#ECBE7B" },
      },

      visual = {
        a = { bg = "#BB9AF7", fg = "#000000" },
        b = { bg = "#3B4261", fg = "#BB9AF7" },
      },

      replace = {
        a = { bg = "#DB4B4B", fg = "#000000" },
        b = { bg = "#3B4261", fg = "#DB4B4B" },
      },

      terminal = {
        a = { bg = "#73DACA", fg = "#000000" },
        b = { bg = "#3B4261", fg = "#73DACA" },
      },

      inactive = {
        a = { bg = "#16161E", fg = "#7AA2F7" },
        b = { bg = "#16161E", fg = "#3B4261" },
        c = { bg = "#16161E", fg = "#3B4261" },
      },
    }

    local lualine = require "lualine"

    local statusline = require "plugins.lualine.default"

    lualine.setup {
      options = {
        globalstatus = true,
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        theme = theme,
        disabled_filetypes = {
          "dashboard",
          "lspinfo",
          "mason",
          "startuptime",
          "checkhealth",
          "help",
          "TelescopePrompt",
          "toggleterm",
          "alpha",
          "lazy",
        },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          statusline.branch,
          statusline.mode,
          statusline.diagnostics,
          statusline.lsp,
        },
        lualine_x = {
          statusline.diff,
          statusline.filetype,
          statusline.filesize,
          statusline.progress,
          statusline.percent,
          statusline.total_lines,
        },
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}
