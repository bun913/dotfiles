local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- 透明度
config.window_background_opacity = 0.9
-- カラースキームの設定
config.color_scheme = "Dark+"
-- フォントサイズの設定
config.font_size = 18
-- ショートカットの設定
config.keys = {
	{ key = "X", mods = "CTRL", action = wezterm.action.ActivateCopyMode },
}

return config
