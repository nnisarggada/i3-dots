local M = {}

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

M.mode = {
  function()
    -- local mode_names = require("plugins.lualine.modes").name
    -- local mode_name = vim.api.nvim_get_mode().mode
    -- if mode_names[mode_name] == nil then
    --   return mode_name
    -- end
    -- return mode_names[mode_name]
    -- return ""
    -- return ""
    -- return ""
    return ""
  end,
  color = function()
    local mode_color = require("plugins.lualine.modes").colors
    return { fg = mode_color[vim.api.nvim_get_mode().mode], bg = "NONE" }
    -- return { fg = "#BBC2CF", bg = "NONE" }
  end,
  separator = { right = "" },
}

M.diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn", "hint" },
  symbols = { error = " ", warn = " ", hint = " " },
  diagnostics_color = {
    error = { fg = "#DB4B4B" },
    warn = { fg = "#ECBE7B" },
    hint = { fg = "#A9A1E1" },
  },
  update_in_insert = false,
  always_visible = false,
  color = { fg = "#BBC2CF", bg = "NONE" },
  separator = { right = "" },
}

M.diff = {
  "diff",
  symbols = { added = " ", modified = " ", removed = " " },
  diff_color = {
    added = { fg = "#98BE65" },
    modified = { fg = "#7AA2F7" },
    removed = { fg = "#DB4B4B" },
  },
  cond = hide_in_width,
  color = { fg = "#BBC2CF", bg = "NONE" },
  separator = { left = "" },
}

M.branch = {
  "branch",
  icons_enabled = true,
  color = { fg = "#BBC2CF", bg = "NONE" },
  icon = " ",
  separator = { right = "" },
}

M.filesize = {
  function()
    local function format_file_size(file)
      local size = vim.fn.getfsize(file)
      if size <= 0 then
        return ""
      end
      local sufixes = { " B", " KB", " MB", " GB" }
      local i = 1
      while size > 1024 do
        size = size / 1024
        i = i + 1
      end
      return string.format("%.1f%s", size, sufixes[i])
    end

    local file = vim.fn.expand "%:p"
    if string.len(file) == 0 then
      return ""
    end
    return format_file_size(file)
  end,
  color = { fg = "#BBC2CF", bg = "NONE" },
  separator = { left = "" },
}

M.lsp = {
  function()
    local null_ls_ok, _ = pcall(require, "null-ls")
    local buf_clients = vim.lsp.buf_get_clients()
    local clients = {}

    -- add client
    for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" then
        table.insert(clients, client.name)
      end
    end

    if null_ls_ok then
      local supported_formatters = list_registered_formatters(vim.bo.filetype)
      vim.list_extend(clients, supported_formatters)

      local supported_linters = list_registered_linters(vim.bo.filetype)
      vim.list_extend(clients, supported_linters)
    end

    if #clients > 0 then
      return table.concat(clients, ", ")
    else
      return "LS Inactive"
    end
  end,
  color = { fg = "#BBC2CF", bg = "NONE" },
  separator = { left = "", right = "" },
}

M.progress = {
  function()
    local current_line = vim.fn.line "."
    local total_lines = vim.fn.line "$"
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end,
  color = { fg = "#BBC2CF", bg = "NONE" },
  separator = { left = "" },
}

M.total_lines = {
  function()
    return "%L"
  end,
  color = { fg = "#BBC2CF", bg = "NONE" },
  separator = { left = "" },
}

M.percent = {
  "progress",
  color = { fg = "#BBC2CF", bg = "NONE" },
  separator = { left = "" },
}

M.spaces = {
  function()
    return vim.api.nvim_buf_get_option(0, "shiftwidth")
  end,
  color = { fg = "#BBC2CF", bg = "NONE" },
}

M.filetype = {
  "filetype",
  color = { fg = "#BBC2CF", bg = "NONE" },
  pading = 0,
  separator = { left = "" },
}

return M
