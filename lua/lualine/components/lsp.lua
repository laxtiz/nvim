local M = require("lualine.component"):extend()

local lsp_clients = function()
  local clients = {}
  for _, client in pairs(vim.lsp.buf_get_clients(0)) do
    table.insert(clients, client.name)
  end
  return table.concat(clients, " ")
end

M.init = function(self, options)
  M.super.init(self, options)
  if not self.options.icon then
    self.options.icon = " "
  end
end

M.update_status = function(_, is_focused)
  if not is_focused then
    return ""
  end

  return lsp_clients()
end

return M
