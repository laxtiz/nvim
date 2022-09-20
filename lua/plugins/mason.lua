---@type PluginSpec
local Spec = { "williamboman/mason.nvim" }

Spec.requires = {
  "williamboman/mason-lspconfig.nvim",
}

Spec.after = {
  "nvim-lspconfig",
}

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  require("mason").setup {
    ui = {
      border = "rounded",
    },
    github = {
      download_url_template = "https://ghproxy.com/github.com/%s/releases/download/%s/%s",
    },
  }

  local mason_lspconfig = require "mason-lspconfig"
  mason_lspconfig.setup {
    automatic_installation = false,
  }

  local lspconfig = require "lspconfig"
  for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
    if lspconfig[server].manager == nil then
      lspconfig[server].setup {}
    end
  end
end

return Spec
