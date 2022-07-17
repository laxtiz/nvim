---@type PluginSpec
local Spec = { "akinsho/toggleterm.nvim" }

Spec.keys = {
  "<F12>",
}

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  local toggleterm = require("toggleterm")

  toggleterm.setup {
    open_mapping = "<F12>",
    close_on_exit = true,
    ---@type string | "vertical" | "horizontal" | "tab" | "float"
    direction = "float",
    float_opts = {
      border = "rounded",
      winblend = 25,
    },
  }
end

return Spec
