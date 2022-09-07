---@type PluginSpec
local Spec = { "numToStr/Comment.nvim" }

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  local comment = require "Comment"

  comment.setup {
    padding = true,
    sticky = true,
    ignore = "^$",
    toggler = { line = "gcc", block = "gbc" },
    opleader = { line = "gc", block = "gb" },
    extra = { above = "gcO", below = "gco", eol = "gcA" },
    mappings = { basic = true, extra = true, extended = false },
    pre_hook = nil,
    post_hook = nil,
  }
end

return Spec
