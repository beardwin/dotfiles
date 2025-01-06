local wezterm = require("wezterm")
local config = {}

config.adjust_window_size_when_changing_font_size = false

config.color_scheme = "Tokyo Night"

config.default_cursor_style = "BlinkingBar"
config.enable_tab_bar = false
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 14

config.keys = {
	-- splitting
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "D",
		mods = "CMD",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	-- pane closing
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "W",
		mods = "CMD",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},

	-- clearing
	{
		key = "k",
		mods = "CMD",
		action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
	},

	-- pane direction
	{
		key = "H",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "L",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "J",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "K",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
}

-- config.background = {
-- 	{
-- 		source = { File = "/Users/ryanbaldwin/Pictures/bg-monterey.jpg" },
-- 		hsb = {
-- 			hue = 1.0,
-- 			saturation = 1.02,
-- 			brightness = 0.25,
-- 		},
-- 		width = "100%",
-- 		height = "100%",
-- 	},
-- 	{
-- 		source = { Color = "#282c35" },
-- 		width = "100%",
-- 		height = "100%",
-- 		opacity = 0.55,
-- 	},
-- }

config.window_background_opacity = 0.5
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE"
config.window_frame = {
	border_left_width = "0.5cell",
	border_right_width = "0.5cell",
	border_top_height = "0.5cell",
	border_bottom_height = "0.5cell",
	border_left_color = "#1a1b26",
	border_right_color = "#1a1b26",
	border_top_color = "#1a1b26",
	border_bottom_color = "#1a1b26",
}
config.window_padding = {
	left = 4,
	right = 4,
	top = 4,
	bottom = 4,
}

config.use_fancy_tab_bar = false

return config
