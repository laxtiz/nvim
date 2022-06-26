---@type PluginSpec
local Spec = { "j-hui/fidget.nvim" }

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  require("fidget").setup {
    text = {
      spinner = "moon",
      done = "✔",
      commenced = "Started",
      completed = "Completed",
    },
    align = {
      bottom = true,
      right = true,
    },
    window = {
      relative = "win",
      blend = 100,
      zindex = nil,
    },
    timer = {
      spinner_rate = 125,
      fidget_decay = 2000,
      task_decay = 1000,
    },
    fmt = {
      leftpad = true,
      stack_upwards = true,
      max_width = 0,
      fidget = function(fidget_name, spinner)
        return string.format("%s %s", spinner, fidget_name)
      end,
      task = function(task_name, message, percentage)
        return string.format(
          "%s%s [%s]",
          message,
          percentage and string.format(" (%.0f%%)", percentage) or "",
          task_name
        )
      end,
    },
    sources = {},
    debug = {
      logging = false,
      strict = false,
    },
  }
end

return Spec
