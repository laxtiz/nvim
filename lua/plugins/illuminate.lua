---@type PluginSpec
local Spec = { "RRethy/vim-illuminate" }

Spec.requires = {
  "nvim-treesitter/nvim-treesitter",
}

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
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
