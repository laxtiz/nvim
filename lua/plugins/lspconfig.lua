---@type PluginSpec
local Spec = { "neovim/nvim-lspconfig" }

Spec.requires = {
  "ray-x/lsp_signature.nvim",
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

    vim.api.nvim_buf_set_keymap(bufnr, "x", "=", "<esc><cmd>lua vim.lsp.buf.range_formatting()<cr>gv", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "==", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "x", "z=", "<esc><cmd>lua vim.lsp.buf.range_code_action()<cr>gv", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "z=", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)

    -- HACK: map rename if availiable, fallback use treesitter-refactor
    if client.resolved_capabilities.rename then
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    end

    require("lsp_signature").on_attach(client, bufnr)
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local ok, ext = pcall(require, "cmp_nvim_lsp")
  if ok then
    capabilities = ext.update_capabilities(capabilities)
  end

  local lspconfig = require("lspconfig")
  lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
    on_attach = on_attach,
    capabilities = capabilities,
  })

  -- for lua
  lspconfig.sumneko_lua.setup {
    settings = {
      Lua = {
        runtime = {
          version = "luajit",
          path = vim.split(package.path, ";"),
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        diagnostics = {
          globals = { "vim" },
        },
        telemetry = {
          enable = false,
        },
      },
    },
  }
end

return Spec
