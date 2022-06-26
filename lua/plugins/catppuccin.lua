---@type PluginSpec
local Spec = { "laxtiz/catppuccin.nvim", branch = "autocmd", as = "catppuccin" }

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  local catppuccin = require("catppuccin")

  catppuccin.before_loading = function()
    local colors = require("catppuccin.api.colors").get_colors()
    require("catppuccin").remap {
      LineNr = { fg = colors.sapphire },
      LineNrAbove = { fg = colors.lavender },
      LineNrBelow = { fg = colors.lavender },
      CursorLineNr = { fg = colors.rosewater },
    }
  end

  catppuccin.setup {
    transparent_background = false,
    term_colors = true,
    styles = {
      comments = "italic",
      conditionals = "italic",
      loops = "NONE",
      functions = "NONE",
      keywords = "NONE",
      strings = "NONE",
      variables = "NONE",
      numbers = "NONE",
      booleans = "NONE",
      properties = "NONE",
      types = "NONE",
      operators = "NONE",
    },
    integrations = {
      treesitter = true,
      ts_rainbow = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = "italic",
          hints = "italic",
          warnings = "italic",
          information = "italic",
        },
        underlines = {
          errors = "undercurl",
          hints = "undercurl",
          warnings = "undercurl",
          information = "undercurl",
        },
      },
      cmp = true,
      lsp_trouble = true,
      telescope = true,
      notify = true,
      which_key = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = true,
      },
      nvimtree = {
        enabled = true,
        show_root = true,
        transparent_panel = true,
      },
      symbols_outline = true,
      bufferline = true,
      lightspeed = false,
      hop = false,
    },
  }

  ---@type string | "latte" | "frappe" | "macchiato" | "mocha"
  vim.g.catppuccin_flavour = "mocha"
  vim.cmd([[colorscheme catppuccin]])
end

return Spec
