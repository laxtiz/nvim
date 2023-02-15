---@type PluginSpec
local Spec = { "utilyre/barbecue.nvim" }

Spec.requires = {
  "SmiteshP/nvim-navic",
  "nvim-tree/nvim-web-devicons",
}

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  require("barbecue").setup {}
end

return Spec
