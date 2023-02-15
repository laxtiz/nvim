---@type PluginSpec
local Spec = { "catppuccin/nvim", as = "catppuccin" }

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  require("catppuccin").setup {
    ---@type string | "latte" | "frappe" | "macchiato" | "mocha"
    flavour = "macchiato",
    background = {
      light = "latte",
      dark = "mocha",
    },
    transparent_background = false,
    show_end_of_buffer = false,
    term_colors = true,
    dim_inactive = {
      enabled = true,
      shade = "dark",
      percentage = 0.15,
    },
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    integrations = {
      treesitter = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      barbecue = {
        dim_dirname = true,
      },
      coc_nvim = false,
      lsp_trouble = true,
      cmp = true,
      lsp_saga = false,
      gitgutter = true,
      gitsigns = true,
      leap = false,
      telescope = true,
      nvimtree = {
        enabled = true,
        show_root = true,
        transparent_panel = false,
      },
      neotree = {
        enabled = false,
        show_root = true,
        transparent_panel = false,
      },
      dap = {
        enabled = false,
        enable_ui = false,
      },
      which_key = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = true,
      },
      dashboard = true,
      neogit = false,
      vim_sneak = false,
      fern = false,
      barbar = false,
      bufferline = true,
      markdown = true,
      lightspeed = false,
      ts_rainbow = true,
      hop = false,
      notify = true,
      telekasten = true,
      symbols_outline = true,
      mini = false,
      aerial = false,
      vimwiki = true,
      beacon = true,
      navic = {
        enabled = true,
        custom_bg = "NONE",
      },
      overseer = true,
    },
    color_overrides = {},
    highlight_overrides = {
      all = function(colors)
        return {
          CursorLineNr = { fg = colors.pink },
          Comment = { fg = colors.overlay0 },
          LineNr = { fg = colors.overlay2 },
        }
      end,
    },
  }

  vim.cmd [[colorscheme catppuccin]]
end

return Spec
