local group = vim.api.nvim_create_augroup("user", { clear = true })

-- restore cursor
vim.api.nvim_create_autocmd("BufReadPost", {
  group = group,
  desc = "restore cursor to last edit postion.",
  callback = function(args)
    local pos = vim.api.nvim_buf_get_mark(args.buf, '"')
    local eof = vim.api.nvim_buf_line_count(args.buf)
    if pos[1] > 0 and pos[1] <= eof then
      vim.api.nvim_win_set_cursor(0, pos)
    end
  end,
})

-- open nested fold
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = group,
  desc = "open closed fold",
  callback = function()
    local pos = vim.api.nvim_win_get_cursor(0)
    if vim.fn.foldclosed(pos[1]) > 0 then
      vim.cmd([[normal! zO]])
    end
  end,
})

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  desc = "highlight on yank",
  callback = function()
    vim.highlight.on_yank()
  end,
})
