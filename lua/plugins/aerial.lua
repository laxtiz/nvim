---@type PluginSpec
local Spec = { "stevearc/aerial.nvim" }

Spec.module = "aerial"

Spec.config = function(name, info)
  require("aerial").setup {
    backends = {
      "lsp",
      "treesitter",
      "markdown",
      "man",
    },
    filter_kind = false,
    attach_mode = "window",
    show_guides = true,
  }
end

return Spec
