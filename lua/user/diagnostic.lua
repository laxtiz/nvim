vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

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
