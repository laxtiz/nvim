---@type PluginSpec
local Spec = { "nvim-tree/nvim-tree.lua" }

Spec.requires = {
  "nvim-tree/nvim-web-devicons",
}

Spec.module_pattern = {
  "^nvim%-tree$",
}

Spec.config = function(name, info)
  local tree = require("nvim-tree")
  -- HACK: reload
  tree.setup_called = false
  tree.setup {
    view = {
      adaptive_size = false,
    },
    renderer = {
      add_trailing = true,
      full_name = true,
      indent_markers = {
        enable = true,
      },
      icons = {
        webdev_colors = true,
        git_placement = "before",
      },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = false,
    },
    filters = {
      dotfiles = false,
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 500,
    },
  }
end

return Spec
