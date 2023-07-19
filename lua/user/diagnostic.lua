vim.diagnostic.config {
  signs = true,
  underline = true,
  virtual_text = {
    prefix = "",
  },
  float = {
    border = "rounded",
    header = { "  Diagnostic", "Float" },
    source = "if_many",
  },
  update_in_insert = false,
}

local signs = { Error = " ", Warn = " ", Info = " ", Hint = " " }
for level, icon in pairs(signs) do
  local name = "DiagnosticSign" .. level
  vim.fn.sign_define(name, { text = icon, texthl = name })
end
