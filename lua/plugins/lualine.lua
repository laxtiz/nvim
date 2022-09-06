---@type PluginSpec
local Spec = { "nvim-lualine/lualine.nvim" }

Spec.requires = {
  "kyazdani42/nvim-web-devicons",
}

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  local lualine = require("lualine")

  lualine.setup {
    options = {
      icons_enabled = true,
      theme = "auto",
      -- section_separators = { left = "", right = "" },
      -- component_separators = { left = "", right = "" },
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
        { "diff", symbols = { added = " ", modified = " ", removed = " " } },
      },
      lualine_c = {
        { "filename", path = 1, symbols = { modified = "  ", readonly = "  " } },
      },
      lualine_y = {
        { "diagnostics" },
        { "lsp", icon = "" },
      },
      lualine_z = {
        "location",
        "progress",
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
end

return Spec
