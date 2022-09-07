---@type PluginSpec
local Spec = { "jose-elias-alvarez/null-ls.nvim" }

Spec.requires = {
  "nvim-lua/plenary.nvim",
}

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  local null = require "null-ls"

  -- null.reset_sources()
  null.setup {
    log = {
      enable = true,
      level = "warn",
    },
    sources = {
      -- null.builtins.formatting.stylua,
      -- null.builtins.formatting.prettier,
      null.builtins.formatting.shfmt,
      null.builtins.formatting.black,
    },
  }
end

return Spec
