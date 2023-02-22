---@type PluginSpec
local Spec = { "williamboman/mason.nvim" }

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
