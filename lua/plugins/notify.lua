---@type PluginSpec
local Spec = { "rcarriga/nvim-notify" }

Spec.requires = {
  "nvim-lua/plenary.nvim",
}

Spec.config = function(name, info)
  local notify = require("notify")
  local levels = vim.log.levels

  notify.setup {
    level = levels.INFO,
  }

  vim.notify = notify
end

return Spec
