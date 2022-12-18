local wezterm = require 'wezterm';

return {
  keys = {
    -- Turn off the default CMD-m Hide action, allowing CMD-m to
    -- be potentially recognized and handled by the tab
    {
      key = "m",
      mods = "CMD",
      action = "DisableDefaultAssignment"
    },
    { key = ' ',
      mods = 'CTRL|CMD',
      action = wezterm.action.QuickSelect
    },
    { key = ' ',
      mods = 'CTRL|CMD',
      action = wezterm.action.QuickSelect
    },
    { key = 'x',
      mods = 'CTRL|CMD',
      action = wezterm.action.ActivateCopyMode
    }
  },
  font_size = 24.0,
  opacity = 0.8,
  color_scheme = "GitHub Dark",
  font = wezterm.font("Ricty Diminished"),
  window_background_opacity = 0.8
}
