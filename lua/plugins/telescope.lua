---@type PluginSpec
local Spec = { "nvim-telescope/telescope.nvim" }

Spec.requires = {
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope-symbols.nvim",
  "folke/trouble.nvim",
}

Spec.module = {
  "telescope",
}

Spec.config = function(name, info)
  local telescope = require("telescope")
  local trouble = require("trouble.providers.telescope")

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
      mappings = {
        i = {
          ["<C-t>"] = trouble.open_with_trouble,
        },
        n = {
          ["<C-t>"] = trouble.open_with_trouble,
        },
      },
    },
  }

  pcall(telescope.load_extension, "notify")
  pcall(telescope.load_extension, "todo-comments")
end

return Spec
