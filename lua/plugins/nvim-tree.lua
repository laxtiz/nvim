---@type PluginSpec
local Spec = { "kyazdani42/nvim-tree.lua" }

Spec.requires = {
  "kyazdani42/nvim-web-devicons",
}

Spec.module_pattern = {
  "^nvim%-tree$",
}

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
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
