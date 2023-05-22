local M = {}

M.name = "tokyonight"

function M.setup()
  if vim.g.custom_theme then
    require "theme.custom".setup()
  else
    -- check if there's a colorscheme configuration
    pcall(require, "theme." .. M.name)

    local theme_ok = pcall(vim.cmd.colorscheme, M.name)
    if not theme_ok then
      vim.cmd.colorscheme "habamax"
      return vim.notify("\nFailed to load colorscheme " .. M.name .. "\nUse habamax instead", vim.log.levels.ERROR)
    else
      vim.cmd.colorscheme(M.name)
    end
  end
end

return M
