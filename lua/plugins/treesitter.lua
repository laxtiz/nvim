---@type PluginSpec
local Spec = { "nvim-treesitter/nvim-treesitter" }

Spec.requires = {
  { "nvim-treesitter/nvim-treesitter-context", after = "nvim-treesitter" },
  { "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" },
  { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
  { "RRethy/nvim-treesitter-endwise", after = "nvim-treesitter" },
  { "p00f/nvim-ts-rainbow", after = "nvim-treesitter" },
}

Spec.run = function()
  local update = require("nvim-treesitter.install").update { with_sync = false }
  update("all")
end

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  require("nvim-treesitter.configs").setup {
    -- ensure_installed = { "lua", "vim" },
    highlight = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<leader>v",
        node_incremental = "<space>",
        node_decremental = "<backspace>",
        scope_incremental = "<leader>s",
      },
    },
    indent = {
      enable = false,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      swap = {
        enable = false,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>b"] = "@parameter.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
      lsp_interop = {
        enable = false,
        border = "double",
        peek_definition_code = {
          ["<leader>s"] = "@block.outer",
        },
      },
    },
    refactor = {
      highlight_definitions = {
        enable = false,
        clear_on_cursor_move = true,
      },
      highlight_current_scope = {
        enable = false,
      },
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "<leader>r",
        },
      },
      navigation = {
        enable = false,
      },
    },
    rainbow = {
      enable = true,
      extended_mode = true,
    },
    endwise = {
      enable = true,
    },
  }

  vim.o.foldmethod = "expr"
  vim.o.foldexpr = "nvim_treesitter#foldexpr()"
  vim.o.updatetime = 500
end

return Spec
