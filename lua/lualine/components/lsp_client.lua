local M = require("lualine.component"):extend()

M.init = function(self, options)
  local global_separator = " " .. require("lualine.config").get_config().options.component_separators.left .. " "
  options.separator = options.separator or global_separator

  options.icon = options.icon or " "

  M.super.init(self, options)
end

---@diagnostic disable-next-line: unused-local
M.update_status = function(self, is_focused)
  if #vim.lsp.buf_get_clients(0) == 0 then
    return ""
  end

  local clients = {}
  for _, client in pairs(vim.lsp.buf_get_clients(0)) do
    table.insert(clients, client.name)
  end

  return table.concat(clients, self.options.separator)
end

return M
