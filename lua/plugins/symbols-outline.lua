---@type PluginSpec
local Spec = { "simrat39/symbols-outline.nvim" }

Spec.module = {
  "symbols-outline",
}

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  local outline = require("symbols-outline")

  outline.setup {
    show_guides = true,
    auto_preview = false,
  }
end

return Spec
