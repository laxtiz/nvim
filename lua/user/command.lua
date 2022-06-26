local command = vim.api.nvim_create_user_command

command("FormatSync", vim.lsp.buf.formatting_sync, {
  desc = "format use lsp with sync.",
  force = true,
})
