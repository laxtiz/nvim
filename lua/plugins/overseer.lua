---@type PluginSpec
local Spec = { "stevearc/overseer.nvim" }

Spec.keys = "<F5>"

Spec.config = function(name, info)
  require("overseer").setup {}

  vim.api.nvim_set_keymap("n", "<F5>", "<cmd>lua require('overseer').run_template()<cr>", { silent = true })
end

return Spec
