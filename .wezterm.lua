-- pull in the wezterm API
local wezterm =  require("wezterm")
-- hold the config
local config =  wezterm.config_builder()

-- space to adjust the font
config.font = wezterm.font("JetBrains Mono")
-- Adjust the size with the following
config.font_size = 13
-- space for configs:

--to modify colours of wezterm:
config.colors = {
  foreground = "#dcd7ba",
  background = "#1f1f28",

  cursor_bg = "#c8c093",
  cursor_fg = "#c8c093",
  cursor_border = "#c8c093",

  selection_fg = "#c8c093",
  selection_bg = "#2d4f67",

  scrollbar_thumb = "#16161d",
  split = "#16161d",

  ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
  brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
  indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
}
-- modify the opacity:
config.window_background_opacity = 0.8 -- 0 - 1 
-- config macose window background
config.macos_window_background_blur = 5 -- 0 - 100


return config
