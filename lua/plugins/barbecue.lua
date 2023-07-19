---@type PluginSpec
local Spec = { "utilyre/barbecue.nvim" }

Spec.requires = {
  "SmiteshP/nvim-navic",
  "nvim-tree/nvim-web-devicons",
}

Spec.config = function(name, info)
  require("barbecue").setup {
    theme = "catppuccin",
    attach_navic = true,
    show_navic = true,
    create_autocmd = true,
  }
end

return Spec
