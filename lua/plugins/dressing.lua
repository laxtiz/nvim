---@type PluginSpec
local Spec = { "stevearc/dressing.nvim" }

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  local dressing = require("dressing")

  dressing.setup {
    input = {
      enabled = true,
      input_only = true,
    },
    select = {
      enabled = true,
    },
  }
end

return Spec
