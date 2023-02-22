---@type PluginSpec
local Spec = { "folke/trouble.nvim" }

Spec.requires = {
  "nvim-tree/nvim-web-devicons",
}

Spec.module = {
  "trouble",
}

Spec.config = function(name, info)
  require("trouble").setup {
    auto_jump = {
      "lsp_definitions",
      "lsp_type_definitions",
    },
    use_diagnostic_signs = true,
  }
end

return Spec
