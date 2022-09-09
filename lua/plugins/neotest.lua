---@type PluginSpec
local Spec = { "nvim-neotest/neotest" }

Spec.requires = {
  "nvim-lua/plenary.nvim",
  "nvim-treesitter/nvim-treesitter",
  "antoinemadec/FixCursorHold.nvim",
  "nvim-neotest/neotest-python",
}

Spec.module = "neotest"

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  require("neotest").setup {
    adapters = {
      require "neotest-python"
    }
  }
end

return Spec
