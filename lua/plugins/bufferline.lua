---@type PluginSpec
local Spec = { "akinsho/bufferline.nvim" }

Spec.requires = {
  "nvim-tree/nvim-web-devicons",
}

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  local signs = { error = " ", warning = " ", info = " ", hint = " " }

  require("bufferline").setup {
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
      },
    },
  }
end

return Spec
