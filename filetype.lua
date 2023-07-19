---@type FileTypeConfig
local config = {
  extension = {
    ["conf"] = "dosini",
  },
  filename = {
    [".envrc"] = "sh",
    ["pip.conf"] = "dosini",
  },
  pattern = {},
}

vim.filetype.add(config)
