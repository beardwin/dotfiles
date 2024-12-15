local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font 'FiraCode Nerd Font Mono'

config.keys = {
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal {domain = 'CurrentPaneDomain'},
  },
  {
    key = 'D',
    mods = 'CMD',
    action = wezterm.action.SplitVertical {domain = 'CurrentPaneDomain'},
  },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'W',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  }
}
return config
