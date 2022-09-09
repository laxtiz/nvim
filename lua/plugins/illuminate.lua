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
    delay = 100,
    modes_allowlist = {
      "n",
    },
    filetypes_denylist = {
      "packer",
      "dashboard",
      "NvimTree",
      "Outline",
      "Trouble",
      "TelescopePrompt",
      "TelescopeResults",
      "OverseerList",
      "OverseerForm",
      "neotest-summary",
    },
    under_cursor = true,
  }
end

return Spec
