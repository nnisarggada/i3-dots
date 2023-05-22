local colorscheme = require("theme").name
return {
  {
    "Alexis12119/nightly.nvim",
    cond = function()
      return colorscheme:match "^nightly"
    end,
  },

  {
    "folke/tokyonight.nvim",
    cond = function()
      return colorscheme:match "^tokyonight"
    end,
  },

  {
    "ellisonleao/gruvbox.nvim",
    cond = function()
      return colorscheme:match "^gruvbox"
    end,
  },

  {
    "catppuccin/nvim",
    cond = function()
      return colorscheme:match "^catppuccin"
    end,
  },

  {
    "rebelot/kanagawa.nvim",
    cond = function()
      return colorscheme:match "^kanagawa"
    end,
  },

  {
    "rmehri01/onenord.nvim",
    cond = function()
      return colorscheme:match "^onenord"
    end,
  },

  {
    "Mofiqul/vscode.nvim",
    cond = function()
      return colorscheme:match "^vscode"
    end,
  },

  {
    "navarasu/onedark.nvim",
    cond = function()
      return colorscheme:match "^onedark"
    end,
  },

  {
    "tanvirtin/monokai.nvim",
    cond = function()
      return colorscheme:match "^monokai"
    end,
  },

  {
    "Mofiqul/dracula.nvim",
    cond = function()
      return colorscheme:match "^dracula"
    end,
  },

  {
    "JoosepAlviste/palenightfall.nvim",
    cond = function()
      return colorscheme:match "^palenightfall"
    end,
  },

  {
    "bluz71/vim-nightfly-colors",
    cond = function()
      return colorscheme:match "^nightfly"
    end,
  },
}
