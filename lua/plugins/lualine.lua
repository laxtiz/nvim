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
      lualine_a = {
        { "mode", icon = "" },
      },
      lualine_b = {
        { "branch", icon = "" },
        {
          "diff",
          colored = true,
          symbols = {
            added = " ",
            modified = " ",
            removed = " ",
          },
        },
        {
          "diagnostics",
          colored = true,
          symbols = {
            icons = { error = " ", warn = " ", info = " ", hint = " " },
            no_icons = { error = "E:", warn = "W:", info = "I:", hint = "H:" },
          },
        },
      },
      lualine_c = {
        { "filename", path = 1, file_status = false },
        { "overseer", colored = true },
      },
    },
    extensions = {
      "nvim-tree",
      "symbols-outline",
      "aerial",
      "toggleterm",
      "trouble",
      "overseer",
      "quickfix",
    },
  }
end

return Spec
