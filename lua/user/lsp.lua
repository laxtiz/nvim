local opts = { silent = true }

local on_attach = function(client, bufnr)
  if client.server_capabilities.completionProvider then
    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
  end

  if client.server_capabilities.definitionProvider then
    vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
  end

  if client.server_capabilities.documentFormattingProvider then
    vim.bo[bufnr].formatexpr = "v:lua.vim.lsp.formatexpr()"
    vim.api.nvim_buf_set_keymap(bufnr, "x", "=", "<cmd>lua vim.lsp.buf.format()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "==", "<cmd>lua vim.lsp.buf.format()<cr>", opts)
  end

  if client.server_capabilities.codeActionProvider then
    vim.api.nvim_buf_set_keymap(bufnr, "x", "z=", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "z=", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  end

  if client.server_capabilities.hoverProvider then
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
  end

  if client.server_capabilities.signatureHelpProvider then
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
  end

  if client.server_capabilities.renameProvider then
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  end
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp", {}),
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    on_attach(client, bufnr)
  end,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
