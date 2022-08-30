vim.cmd([[packadd packer.nvim]])

---@type table<string, PluginSpec>
local plugins = setmetatable({}, {
  __index = function(_, key)
    local spec_name = "plugins." .. key
    return require(spec_name)
  end,
})

---@param use PackerUse
---@param use_rocks PackerUseRocks
---@diagnostic disable-next-line: unused-local
local spec = function(use, use_rocks)
  use { "wbthomason/packer.nvim", opt = true }
  use { "github/copilot.vim", opt = true }

  use(plugins["mason"])
  use(plugins["lspconfig"])
  use(plugins["null-ls"])
  use(plugins["fidget"])
  use(plugins["cmp"])
  use(plugins["treesitter"])
  use(plugins["autopairs"])
  use(plugins["comment"])

  use(plugins["bufferline"])
  use(plugins["lualine"])
  use(plugins["gitsigns"])
  use(plugins["indent-blankline"])
  use(plugins["todo-comments"])

  -- UI Components, maybe lazy-loaded
  use(plugins["toggleterm"])
  use(plugins["nvim-tree"])
  use(plugins["symbols-outline"])
  use(plugins["telescope"])
  use(plugins["dressing"])
  use(plugins["trouble"])
  use(plugins["notify"])
  use(plugins["which-key"])

  -- colorscheme
  use(plugins["catppuccin"])

  -- not need setup.
  use { "dstein64/vim-startuptime", cmd = "StartupTime" }
  use("gpanders/editorconfig.nvim")
  use("lewis6991/impatient.nvim")

  -- vallina plugins
  use("honza/vim-snippets")
  use("tpope/vim-surround")
  use("tpope/vim-repeat")
end

---@type PackerConfig
local config = {
  autoremove = true,
  disable_commands = false,
  display = {
    open_fn = require("packer.util").float,
  },
  git = {
    -- HACK: anybody need this
    default_url_format = "https://ghproxy.com/github.com/%s.git",
  },
  profile = {
    enable = false,
  },
}

return require("packer").startup { spec, config = config }
