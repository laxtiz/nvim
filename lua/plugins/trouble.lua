---@type PluginSpec
local Spec = { "folke/trouble.nvim" }

Spec.requires = {
  "kyazdani42/nvim-web-devicons",
}

Spec.module = {
  "trouble",
}

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  local trouble = require "trouble"

  trouble.setup {
    auto_jump = {
      "lsp_definitions",
      "lsp_type_definitions",
    },
    use_diagnostic_signs = true,
  }
end

return Spec
