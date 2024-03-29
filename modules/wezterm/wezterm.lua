local wezterm = require("wezterm")
wezterm.add_to_config_reload_watch_list(wezterm.config_dir)

return {

  -- colors
  color_scheme = "Catppuccin Mocha",
  colors = {
    background = "#0E1116",
  },

  -- fonts
  font = wezterm.font("JetBrains Mono"),
  font_size = 14.0,

  -- tab bar
  hide_tab_bar_if_only_one_tab = true,
  tab_max_width = 32,
  use_fancy_tab_bar = true,

  -- window
  window_background_opacity = 0.95,
  window_close_confirmation = "NeverPrompt",
  window_decorations = "RESIZE",
  adjust_window_size_when_changing_font_size = false,
  window_padding = {
    left = "2cell",
    right = "2cell",
    top = "0.25cell",
    bottom = "0.25cell",
  }
}
