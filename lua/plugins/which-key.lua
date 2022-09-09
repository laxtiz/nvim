---@type PluginSpec
local Spec = { "folke/which-key.nvim" }

Spec.requires = {
  "nvim-lua/plenary.nvim",
}

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  local wk = require "which-key"

  wk.setup {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = false,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    operators = { gc = "Comment linewise", gb = "Comment blockwise" },
    key_labels = {
      ["<space>"] = "SPC",
      ["<tab>"] = "TAB",
    },
    window = {
      border = "none",
      position = "bottom",
      winblend = 25,
    },
    layout = {
      align = "center",
    },
    show_help = true,
    triggers = "auto",
  }

  wk.register {
    ["?"] = { "<cmd>lua require'which-key'.show_command()<cr>", "Which Key?" },
  }

  wk.register({
    ["if"] = "inner function",
    ["af"] = "outer function",
    ["ic"] = "inner class",
    ["ac"] = "outer class",
  }, { mode = "o" })

  wk.register({
    b = { "<cmd>lua require'bufferline'.cycle(-1)<cr>", "Previous buffer" },
    d = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous diagnostic" },
    m = "Previous function start",
    M = "Previous function end",
    ["["] = "Previous class start",
    ["]"] = "Previous class end",
  }, { prefix = "[" })

  wk.register({
    b = { "<cmd>lua require'bufferline'.cycle(1)<cr>", "Next buffer" },
    d = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next diagnostic" },
    m = "Next function start",
    M = "Next function end",
    ["["] = "Next class start",
    ["]"] = "Next class end",
  }, { prefix = "]" })

  wk.register({
    D = { "<cmd>lua require'trouble'.open'lsp_type_definitions'<cr>", "Goto type definitions" },
    d = { "<cmd>lua require'trouble'.open'lsp_definitions'<cr>", "Goto definitions" },
    i = { "<cmd>lua require'trouble'.open'lsp_implementations'<cr>", "List implementations" },
    r = { "<cmd>lua require'trouble'.open'lsp_references'<cr>", "List references" },
    O = { "<cmd>lua require'symbols-outline'.open_outline()<cr>", "Outline" },
    f = { "<cmd>lua require'nvim-tree'.toggle()<cr>", "NvimTree" },
  }, { prefix = "g" })

  wk.register({
    r = "Rename (treesitter or lsp)",
    v = "Incremental selection",
    e = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Current diagnostics" },
    d = { "<cmd>lua require'trouble'.open'document_diagnostics'<cr>", "Document diagnostics" },
    w = { "<cmd>lua require'trouble'.open'workspace_diagnostics'<cr>", "Workspace diagnostics" },
    t = {
      name = "Telescope",
      t = { "<cmd>lua require'telescope.command'.load_command()<cr>", "Builtin" },
      s = { "<cmd>lua require'telescope.command'.load_command'symbols'<cr>", "Symbols" },
      d = { "<cmd>lua require'telescope.command'.load_command'lsp_document_symbols'<cr>", "Document Symbols" },
      w = { "<cmd>lua require'telescope.command'.load_command'lsp_workspace_symbols'<cr>", "Workspace Symbols" },
      f = { "<cmd>lua require'telescope.command'.load_command'find_files'<cr>", "Find Files" },
      o = { "<cmd>lua require'telescope.command'.load_command'oldfiles'<cr>", "Old Files" },
    },
  }, { prefix = "<leader>" })
end

return Spec
