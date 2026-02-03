local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Appearance Settings
config.color_scheme = 'rose-pine'
config.font_size = 12.0
config.window_background_opacity = 0.8
config.window_decorations = "RESIZE" -- Cleaner look without title bar

-- Tab Bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

local act = wezterm.action
config.keys = {
  -- Split horizontal/vertical
  { key = '\"', mods = 'LEADER|SHIFT',       action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = '%', mods = 'LEADER|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  
  -- Navigate panes with HJKL
  { key = 'h', mods = 'CTRL', action = act.ActivatePaneDirection 'Left' },
  { key = 'j', mods = 'CTRL', action = act.ActivatePaneDirection 'Down' },
  { key = 'k', mods = 'CTRL', action = act.ActivatePaneDirection 'Up' },
  { key = 'l', mods = 'CTRL', action = act.ActivatePaneDirection 'Right' },
  
  -- Toggle Zoom (make one pane full screen)
  { key = 'z', mods = 'LEADER', action = act.TogglePaneZoomState },
  
  -- Create/Close tabs
  { key = 'c', mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'x', mods = 'LEADER', action = act.CloseCurrentPane { confirm = true } },
}

return config