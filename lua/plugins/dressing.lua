---@type PluginSpec
local Spec = { "stevearc/dressing.nvim" }

Spec.config = function(name, info)
  require("dressing").setup {
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
