---@type PluginSpec
local Spec = { "nvim-lualine/lualine.nvim" }

Spec.requires = {
  "nvim-tree/nvim-web-devicons",
}

Spec.config = function(name, info)
  require("lualine").setup {
    options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {},
      always_divide_middle = true,
      globalstatus = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = {
        { "filename", path = 1, file_status = false },
      },
    },
    extensions = {
      "nvim-tree",
      "symbols-outline",
      "aerial",
      "toggleterm",
      "trouble",
      "quickfix",
    },
  }
end

return Spec
