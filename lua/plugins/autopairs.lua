---@type PluginSpec
local Spec = { "windwp/nvim-autopairs" }

Spec.config = function(name, info)
  require("nvim-autopairs").setup {
    break_undo = false,
  }
end

return Spec
