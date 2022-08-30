---@type PluginSpec
local Spec = { "williamboman/mason.nvim" }

Spec.requires = {
  "williamboman/mason-lspconfig.nvim",
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
end

return Spec
