---@type ChadrcConfig 
 local M = {}
 M.ui = {
  theme = 'chadracula',
  tabufline = {show_numbers = true},
  ndash = {load_on_startup = true},
}
 M.plugins = "custom.plugins"
 M.mappings = require "custom.mappings"
 return M
