---@type PluginSpec
local Spec = { "lukas-reineke/indent-blankline.nvim" }

Spec.config = function(name, info)
  require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = false,
    filetype_exclude = {
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
    context_highlight_list = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
      "IndentBlanklineIndent3",
      "IndentBlanklineIndent4",
      "IndentBlanklineIndent5",
      "IndentBlanklineIndent6",
    },
  }
end

return Spec
