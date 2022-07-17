---@type PluginSpec
local Spec = { "lewis6991/gitsigns.nvim" }

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  local gitsigns = require("gitsigns")

  gitsigns.setup {
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = false,
      virt_text_pos = "right_align",
    },
  }
end

return Spec
