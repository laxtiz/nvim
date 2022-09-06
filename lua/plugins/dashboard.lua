---@type PluginSpec
local Spec = { "glepnir/dashboard-nvim" }

---@param name string
---@param info PluginInfo
---@diagnostic disable-next-line: unused-local
Spec.config = function(name, info)
  local db = require("dashboard")

  ---Return the string left justified in a string of length width
  ---@param text string
  ---@param width? integer
  ---@return string
  local title = function(text, width)
    width = width or 16
    return string.format("%-" .. width .. "s", text)
  end

  db.custom_header = {
    "⡢⡒⡐⠄⢀⠀⡀⢀⠀⡀⢀⠀⡀⢀⠀⠠⠀⢀⠀⡀⢀⠀⢀⠀⢀⠀⢀⠀⢀⠀⢀⠀⢀⠀⢀⠀⢀⠀⢀⠀",
    "⢊⢆⠊⡐⡀⠀⠄⠀⠄⠀⠄⢀⠠⠀⢀⠂⠐⠀⡀⢀⠀⠄⠀⠄⠀⠄⠀⠄⠀⠄⠀⠄⠀⠄⠀⠄⠀⠄⠀⢂",
    "⠨⠊⠨⠐⡐⠡⡐⠄⡂⡁⡀⠄⢀⠐⠀⠄⠂⠁⠀⡀⠠⠐⠀⠂⠐⠀⠁⡀⠂⠐⠀⠐⠀⠐⡀⢐⢀⢐⢌⠐",
    "⠈⠀⠐⠀⠠⠁⠀⠠⠀⡀⠄⠈⠀⠐⢈⠀⠐⠀⠁⠀⠀⠄⠀⠂⠈⠀⠂⠀⠄⠂⠠⠁⠊⠐⠈⡀⠄⢀⠀⠄",
    "⠀⠠⠁⢈⠀⠠⠈⠀⠠⠀⠀⠄⠁⠀⠔⠀⡈⢀⠀⠁⠀⠐⠀⢄⠁⢀⠁⠠⠀⠄⠀⠄⠀⠂⠀⠄⠀⠄⠀⡀",
    "⠀⠀⠄⠂⠀⠠⠀⠈⡀⠐⢠⡁⠐⠀⡇⠁⠀⡀⠀⠀⢁⠐⠀⠐⡥⡀⠀⠐⠀⠠⠀⠠⠀⠀⢁⠀⠂⠀⠂⠀",
    "⡂⠂⢀⠀⠠⠀⠀⠄⠀⡀⢴⡄⠀⠨⣳⠁⠀⡀⠀⠄⠀⢕⡀⠀⠰⣔⢆⢁⠀⠂⢈⠀⢀⠀⠀⠄⠀⢁⠀⠂",
    "⢌⠀⠀⠀⠀⠄⠀⠄⠂⠀⣗⢧⠀⠘⡮⡂⠀⢀⠀⠰⡀⠨⢮⢄⠀⠱⣝⢖⢤⠀⠀⠀⠀⠀⠀⠄⠂⠀⠠⠀",
    "⡂⠀⠄⠂⠀⠀⠀⠀⢀⠨⡮⡳⣅⠀⡯⡫⡄⠀⠀⠐⡧⡀⠹⡪⡦⡀⠹⣝⢮⢮⢄⠐⠀⠁⠀⠀⠀⠀⠂⠀",
    "⢌⠀⠀⠀⠀⠀⠂⠈⠀⠈⠋⠉⠊⠢⠩⡫⣏⢆⠀⠀⢝⣖⢄⠱⠊⠉⠀⠁⠉⠊⠮⠀⢀⠀⠀⠀⠈⠀⠐⠀",
    "⡐⠀⡨⠀⠀⡂⠀⠀⠈⢐⢖⢵⢱⢢⡢⣹⢪⢯⣲⣀⠘⣎⢧⡢⡪⡫⡫⡫⡪⢦⡸⠀⠀⠀⠂⠁⡄⠀⠁⠀",
    "⠂⢌⠢⡁⠀⠌⠄⠀⠀⠀⣳⢱⡱⡱⣕⡳⣝⣕⢧⡳⣕⢜⢵⡹⣕⢵⢱⢕⡝⣜⠎⠀⠈⠀⠀⠀⠀⠀⠄⠁",
    "⠨⡂⢕⠨⠠⢑⠀⠂⠀⠀⢸⢕⣝⢮⢮⡺⣪⢪⡳⣝⢮⡫⡳⣝⣜⢮⢳⢕⣝⢮⠃⠀⠂⠁⠀⠈⠀⠀⡀⠀",
    "⠐⢌⠐⠌⠌⡐⠀⡀⠀⢀⠀⠓⣗⢗⢧⡫⣎⢇⢏⢞⢮⢪⡫⡺⣜⢵⢽⢕⠗⢅⠠⠐⠀⠀⠂⠀⠀⠀⠀⠀",
    "⠨⠠⠡⠡⢁⠂⠁⠀⠀⠀⠀⣠⣺⡪⡧⡋⢮⢮⢯⢯⣳⡳⣝⢎⢎⢳⣱⡡⡑⠅⠀⠀⠀⠂⠀⠀⠀⠀⠁⠀",
    "⠠⠁⠅⠡⠂⠠⠐⠀⠀⣠⡪⡗⣗⣝⢮⣺⡪⡫⣳⠳⡣⡯⡮⣳⡳⣕⢗⣝⣎⡀⠀⠈⠀⠀⠂⠀⠈⠀⠀⠀",
    "⠈⠌⡈⠀⢀⠂⠀⠀⣔⣗⢕⠡⡳⣳⢳⡳⣝⢎⢀⠱⣝⢮⣫⡺⣺⣪⡳⡕⡑⡵⡀⠁⠀⠁⠀⠀⡀⠀⡀⠄",
    "⠈⠄⠀⡴⠀⣄⢴⢸⢔⢎⢆⣗⢝⢮⠳⢙⣜⢮⡳⣕⡕⣗⢵⢝⢮⢺⡪⡲⣕⢍⢧⠀⠐⠀⠈⠀⠀⠀⡀⢄",
    "⠈⠀⡼⠃⢐⡕⡇⠣⡡⡢⡮⠮⡲⡀⡁⢧⢳⢕⣝⢮⢺⢜⡘⢉⢎⢧⡫⣺⡪⣆⠱⠁⠀⠠⠀⢀⠈⡠⡪⠂",
    "⠀⠠⡋⠀⢐⣕⢝⢌⢸⢸⡸⡸⡂⡎⡮⡊⡪⡓⢕⢕⢙⢌⢖⡌⢕⢕⣝⢜⣎⢊⠄⠅⢀⠀⡀⠀⢐⡑⢀⢀",
  }
  db.custom_center = {
    {
      icon = "  ",
      desc = title("New File"),
      action = db.new_file
    },
    {
      icon = "  ",
      desc = title("Recent Files"),
      action = function()
        require("telescope.command").load_command("oldfiles")
      end,
    },
    {
      icon = "  ",
      desc = title("Find Files"),
      action = function()
        require("telescope.command").load_command("find_files")
      end,
    },
    {
      icon = "  ",
      desc = title("Packer Sync"),
      action = function()
        require("plugins").sync()
      end,
    },
    {
      icon = "  ",
      desc = title("Quit Nvim"),
      action = "qall"
    },
  }
end

return Spec
