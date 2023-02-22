---@type PluginSpec
local Spec = { "simrat39/symbols-outline.nvim" }

Spec.module = {
  "symbols-outline",
}

Spec.config = function(name, info)
  local outline = require("symbols-outline")

  outline.setup {
    show_guides = true,
    auto_preview = false,
  }
end

return Spec
