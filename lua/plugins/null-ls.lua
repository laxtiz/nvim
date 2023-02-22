---@type PluginSpec
local Spec = { "jose-elias-alvarez/null-ls.nvim" }

Spec.requires = {
  "nvim-lua/plenary.nvim",
}

Spec.config = function(name, info)
  local null = require("null-ls")

  -- null.reset_sources()
  null.setup {
    log = {
      enable = true,
      level = "warn",
    },
    sources = {
      -- null.builtins.formatting.stylua,
      null.builtins.formatting.shfmt,
      null.builtins.formatting.black,
      null.builtins.formatting.yamlfmt,
    },
  }
end

return Spec
