local navic = require "nvim-navic"

local M = require("lualine.component"):extend()

M.init = function(self, options)
  local global_separator = " " .. require("lualine.config").get_config().options.component_separators.left .. " "
  options.separator = options.separator or global_separator

  M.super.init(self, options)
  require("nvim-navic").setup(self.options)
end

---@diagnostic disable-next-line: unused-local
M.update_status = function(self, is_focused)
  if not navic.is_available() then
    return ""
  end

  return navic.get_location { separator = self.options.separator }
end

return M
