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
  local telescope = require "telescope"

  telescope.setup {
    defaults = {
      ---@type string | "horizontal" | "vertical" | "center" | "cursor" | "flex" | "bottom_pane"
      layout_strategy = "flex",
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

  -- HACK: ignore error.
  local load_extension = function(ext_name)
    local ok, ext = pcall(telescope.load_extension, ext_name)
    if ok then
      return ext
    end
    vim.notify(ext, vim.log.levels.WARN)
  end

  load_extension "notify"
  load_extension "todo-comments"

  vim.keymap.set("c", "<C-R>", "<Plug>(TelescopeFuzzyCommandSearch)")
end

return Spec
