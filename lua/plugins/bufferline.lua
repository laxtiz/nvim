---@type PluginSpec
local Spec = { "akinsho/bufferline.nvim" }

Spec.requires = {
  "kyazdani42/nvim-web-devicons",
}

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  local bufferline = require("bufferline")
  local signs = { error = " ", warning = " ", info = " ", hint = " " }

  bufferline.setup {
    options = {
      mode = "buffers",
      themable = true,
      numbers = "both",
      diagnostics = "nvim_lsp",
      ---@diagnostic disable-next-line: unused-local
      diagnostics_indicator = function(count, level, diagnostic_dict, context)
        return signs[level] .. count
      end,
      offsets = {
        {
          filetype = "NvimTree",
          text = "NvimTree",
          highlight = "NvimTreeSymlink",
        },
        {
          filetype = "OverseerList",
          text = "Overseer",
          highlight = "OverseerTask",
        },
      },
    },
  }
end

return Spec
