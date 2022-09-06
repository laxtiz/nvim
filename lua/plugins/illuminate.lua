---@type PluginSpec
local Spec = { "RRethy/vim-illuminate" }

Spec.requires = {
  "nvim-treesitter",
}

Spec.config = function()
  require("illuminate").configure {
    providers = {
      "lsp",
      "treesitter",
      "regex",
    },
    under_cursor = true,
  }
end

return Spec
