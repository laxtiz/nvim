---@type PluginSpec
local Spec = { "folke/todo-comments.nvim" }

-- PERF: fully optimised
-- HACK: hmmm, this looks a bit funky
-- TODO: What else?
-- NOTE: adding a note
-- FIX: this needs fixing
-- WARN: ???
-- FEAT: New feature

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  local todo = require "todo-comments"

  todo.setup {
    signs = true,
    colors = {
      feat = { "Special", "#F5C2E7" },
    },
    keywords = {
      FEAT = { icon = "✨", color = "feat", alt = { "NEW" } },
    },
    merge_keywords = true,
    highlight = {
      before = "",
      keyword = "wide",
      after = "fg",
      comments_only = true,
      max_line_len = 160,
      exclude = {},
    },
  }
end

return Spec
