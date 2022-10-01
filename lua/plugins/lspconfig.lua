---@type PluginSpec
local Spec = { "neovim/nvim-lspconfig" }

Spec.requires = {
  "williamboman/mason-lspconfig.nvim",
  "ray-x/lsp_signature.nvim",
  "SmiteshP/nvim-navic",
  "folke/lua-dev.nvim",
  "simrat39/rust-tools.nvim",
  "p00f/clangd_extensions.nvim",
}

Spec.after = {
  "mason.nvim",
}

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  local opts = { silent = true }

  local on_attach = function(client, bufnr)
    vim.bo[bufnr].formatexpr = "v:lua.vim.lsp.formatexpr()"
    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
    vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"

    if vim.fn.has "nvim-0.8" then
      vim.api.nvim_buf_set_keymap(bufnr, "x", "=", "<cmd>lua vim.lsp.buf.format()<cr>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "==", "<cmd>lua vim.lsp.buf.format()<cr>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "x", "z=", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "z=", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    else
      vim.api.nvim_buf_set_keymap(bufnr, "x", "=", "<esc><cmd>lua vim.lsp.buf.range_formatting()<cr>gv", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "==", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "x", "z=", "<esc><cmd>lua vim.lsp.buf.range_code_action()<cr>gv", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "z=", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    end

    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)

    -- HACK: map rename if availiable, fallback use treesitter-refactor
    if client.server_capabilities.renameProvider then
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    end

    if client.server_capabilities.documentSymbolProvider then
      require("nvim-navic").attach(client, bufnr)
    end

    if client.server_capabilities.signatureHelpProvider then
      require("lsp_signature").on_attach(client, bufnr)
    end
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  pcall(function()
    require("cmp_nvim_lsp").update_capabilities(capabilities)
  end)

  local default_config = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  local lspconfig = require "lspconfig"
  lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
    on_attach = on_attach,
    capabilities = capabilities,
  })

  local mason_lspconfig = require "mason-lspconfig"
  mason_lspconfig.setup {
    ensure_installed = { "sumneko_lua" },
    automatic_installation = true,
  }

  -- for lua
  require("lua-dev").setup {
    library = {
      enabled = true,
      runtime = true,
      types = true,
      plugins = true,
    },
    setup_jsonls = true,
  }

  -- for rust
  require("rust-tools").setup {
    server = default_config,
  }

  -- for clangd
  require("clangd_extensions").setup {
    server = default_config,
  }

  -- other server installed with mason.
  for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
    if lspconfig[server_name].manager == nil then
      lspconfig[server_name].setup {}
    end
  end
end

return Spec
