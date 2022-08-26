-- enable filetype.lua and disable filetype.vim
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

vim.filetype.add {
  extension = {
    ["conf"] = "dosini",
  },
  filename = {
    [".envrc"] = "sh",
    ["pip.conf"] = "dosini",
  },
  pattern = {},
}
