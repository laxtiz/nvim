---@type PluginSpec
local Spec = { "nvim-telescope/telescope.nvim" }

Spec.requires = {
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope-symbols.nvim",
}

Spec.module = {
  "telescope",
}

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  local telescope = require("telescope")

  telescope.setup {
    defaults = {
      ---@type string | "horizontal" | "vertical" | "center" | "cursor" | "flex" | "bottom_pane"
      layout_strategy = "flex",
      layout_config = {
        flex = {
          flip_columns = 132,
        },
      },
      winblend = 25,
      mappings = {},
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  }

  pcall(telescope.load_extension, "notify")
  pcall(telescope.load_extension, "todo-comments")
end

return Spec
