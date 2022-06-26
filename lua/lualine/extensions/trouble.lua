local M = {}

local trouble_mode = function()
  return require("trouble.config").options.mode
end

M.sections = {
  lualine_a = { "filetype" },
  lualine_b = { trouble_mode },
}

M.filetypes = { "Trouble" }

return M
