require("user.options")
require("user.keymap")
require("user.autocmd")
require("user.lsp")
require("user.diagnostic")

if vim.g.vscode ~= 1 then
  require("user.bootstrap")
end
