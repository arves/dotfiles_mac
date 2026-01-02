-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- config.color_scheme = "tokyonight_night"
config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "catppuccin-macchiato"
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 16

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.window_background_opacity = 0.8
config.macos_window_background_blur = 0

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = false

-- config.colors = {
-- 	background = "#1a1d23",
-- }

-- and finally, return the configuration to wezterm
return config
