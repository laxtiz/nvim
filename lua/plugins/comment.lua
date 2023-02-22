---@type PluginSpec
local Spec = { "numToStr/Comment.nvim" }

Spec.config = function(name, info)
  require("Comment").setup {
    padding = true,
    sticky = true,
    ignore = "^$",
    toggler = { line = "gcc", block = "gbc" },
    opleader = { line = "gc", block = "gb" },
    extra = { above = "gcO", below = "gco", eol = "gcA" },
    mappings = { basic = true, extra = true, extended = false },
  }
end

return Spec
