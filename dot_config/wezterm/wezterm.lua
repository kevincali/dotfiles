local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.color_scheme = 'catppuccin-mocha'
config.enable_tab_bar = false

config.window_close_confirmation = 'NeverPrompt'

return config
