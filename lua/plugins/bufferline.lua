---@type PluginSpec
local Spec = { "akinsho/bufferline.nvim" }

Spec.requires = {
  "nvim-tree/nvim-web-devicons",
}

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
          text_align = "center",
          highlight = "NvimTreeSymlink",
          separator = true,
        },
      },
    },
  }
end

return Spec
