local wezterm = require 'wezterm';

return {
  keys = {
    -- Turn off the default CMD-m Hide action, allowing CMD-m to
    -- be potentially recognized and handled by the tab
    {
      key="m",
      mods="CMD",
      action="DisableDefaultAssignment"
    }
  },
  font_size = 20.0,
  color_scheme = "GitHub Dark",
  font = wezterm.font("Ricty Diminished"),
  window_background_opacity = 0.9,
}
