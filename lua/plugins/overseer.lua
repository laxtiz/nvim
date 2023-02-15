---@type PluginSpec
local Spec = { "stevearc/overseer.nvim" }

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  require("overseer").setup {}
end

return Spec
