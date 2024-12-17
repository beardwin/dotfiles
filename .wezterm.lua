local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font 'FiraCode Nerd Font Mono'
config.font_size = 14

config.adjust_window_size_when_changing_font_size = false


config.keys = {
  -- splitting
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

  -- pane closing
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'W',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },

  -- clearing
  {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
  },

  -- pane direction
  {
    key = 'H',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'L',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'J',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'K',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
}

return config
