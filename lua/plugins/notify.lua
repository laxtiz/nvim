---@type PluginSpec
local Spec = { "rcarriga/nvim-notify" }

Spec.requires = {
  "nvim-lua/plenary.nvim",
}

---@param name string
---@param plugin PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, plugin)
  local notify = require("notify")
  local levels = vim.log.levels

  notify.setup {
    level = levels.INFO,
  }

  vim.notify = notify
end

return Spec
