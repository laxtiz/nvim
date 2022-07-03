vim.o.modeline = true

vim.o.title = true
vim.o.mouse = "vn"

vim.o.history = 1000
vim.o.updatetime = 500

vim.o.cursorline = true
vim.o.cursorcolumn = false
vim.o.scrolloff = 2

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.undofile = true

vim.o.termguicolors = true
vim.o.winblend = 25

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"

vim.o.showmode = false
vim.o.ruler = false

-- Neovide
-- https://github.com/neovide/neovide
if vim.g.neovide then
  vim.o.guifont = "Rec Mono Duotone:h12"
  vim.g.neovide_fullscreen = false
  vim.g.neovide_transparency = 0.8
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_vfx_mode = "railgun"
end
