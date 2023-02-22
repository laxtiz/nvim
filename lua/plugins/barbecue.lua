---@type PluginSpec
local Spec = { "utilyre/barbecue.nvim" }

Spec.requires = {
  "SmiteshP/nvim-navic",
  "nvim-tree/nvim-web-devicons",
}

Spec.config = function(name, info)
  require("barbecue").setup {}
end

return Spec
