---@type PluginSpec
local Spec = { "windwp/nvim-autopairs" }

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  require("nvim-autopairs").setup {
    break_undo = false,
  }
end

return Spec
