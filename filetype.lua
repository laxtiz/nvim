-- enable filetype.lua and disable filetype.vim
if vim.fn.has("nvim-0.8") == 1 then
  vim.g.do_legacy_filetype = nil
else
  vim.g.did_load_filetypes = 0
  vim.g.do_filetype_lua = 1
end

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
