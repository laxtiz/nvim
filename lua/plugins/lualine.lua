---@type PluginSpec
local Spec = { "nvim-lualine/lualine.nvim" }

Spec.requires = {
  "nvim-tree/nvim-web-devicons",
}

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  local config = {
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
      },
    },
    extensions = {
      "nvim-tree",
      "symbols-outline",
      "toggleterm",
      "trouble",
      "quickfix",
    },
  }

  require("lualine").setup(config)
end

return Spec
