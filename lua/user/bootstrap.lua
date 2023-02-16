-- bootstrap install packer.nvim
local levels = vim.log.levels
local group = vim.api.nvim_create_augroup("plugins", { clear = true })

---@diagnostic disable-next-line: unused-local
local sync = function(job_id, exit_code, event)
  if exit_code ~= 0 then
    vim.notify("failed on install packer.nvim", levels.ERROR)
  else
    vim.notify("packer.nvim installed, synchronizing...")
    require("plugins").sync()
  end
end

local bootstrap = function()
  local packpath = vim.fn.stdpath("data") .. "/site"
  local install_path = packpath .. "/pack/packer/opt/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) == 0 then
    return
  end

  vim.notify("Bootstrap Install packer.nvim")
  local cmd = {
    "git",
    "clone",
    "--depth",
    "1",
    "https://ghproxy.com/github.com/wbthomason/packer.nvim.git",
    install_path,
  }
  vim.fn.jobstart(cmd, { on_exit = sync })
end

vim.api.nvim_create_autocmd("VimEnter", {
  group = group,
  callback = function()
    vim.fn.timer_start(3000, bootstrap)
  end,
})

vim.api.nvim_create_autocmd("User", {
  group = group,
  pattern = "PackerCompileDone",
  callback = function()
    vim.notify("plugins compile successed.")
  end,
})

-- HACK: auto reload plugins module
---@param module_name string
local reload = function(module_name)
  local re = vim.regex("\\v^" .. module_name .. "([./][a-zA-Z0-9_-]+)*$")
  for name, _ in pairs(package.loaded) do
    if re:match_str(name) then
      package.loaded[name] = nil
    end
  end
end

vim.api.nvim_create_autocmd("BufWritePost", {
  group = group,
  pattern = { "plugins.lua", "*/plugins/*.lua" },
  callback = function()
    reload("plugins")
    require("plugins").compile()
  end,
})

vim.api.nvim_create_user_command("PackerSync", function()
  require("plugins").sync()
end, { desc = "PackerSync wrapped" })
