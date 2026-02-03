local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- Appearance Settings
config.color_scheme = 'rose-pine'
config.font_size = 12.0
config.window_background_opacity = 0.9 
config.window_decorations = "RESIZE"

config.colors = {
  selection_bg = '#31748f', -- Rose Pine 'Pine' color (blue-ish)
  selection_fg = '#e0def4', -- Rose Pine 'Text' color

  tab_bar = {
    background = '#191724',

    new_tab = {
      bg_color = '#191724', -- Matches your bar background
      fg_color = '#ebbcba', -- Rose Pine 'Rose' color (pinkish)
    },
    
    new_tab_hover = {
      bg_color = '#ebbcba',
      fg_color = '#191724',
    },

    inactive_tab = {
      bg_color = '#191724',
      fg_color = '#6e6a86',
    },
  },
}
-- Tab Bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

-- Leader Key (Tmux style)
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  -- Split horizontal/vertical
  { key = '\"', mods = 'LEADER|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = '%',  mods = 'LEADER|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  
  -- Navigate panes with HJKL
  { key = 'h', mods = 'CTRL', action = act.ActivatePaneDirection 'Left' },
  { key = 'j', mods = 'CTRL', action = act.ActivatePaneDirection 'Down' },
  { key = 'k', mods = 'CTRL', action = act.ActivatePaneDirection 'Up' },
  { key = 'l', mods = 'CTRL', action = act.ActivatePaneDirection 'Right' },
  
  -- Toggle Zoom
  { key = 'z', mods = 'LEADER', action = act.TogglePaneZoomState },
  
  -- Create/Close tabs
  { key = 'c', mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'x', mods = 'LEADER', action = act.CloseCurrentPane { confirm = true } },

  -- Quick SSH Jumps
  { 
    key = 'l', 
    mods = 'LEADER', 
    action = act.SpawnCommandInNewTab { args = { 'ssh', 'lunix' } } 
  },
  { 
    key = 'b', 
    mods = 'LEADER', 
    action = act.SpawnCommandInNewTab { args = { 'ssh', 'dlfybsd' } } 
  },
}

-- Custom Tab Title Formatting
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local title = tab.active_pane.title
  if tab.is_active then
    return {
      { Background = { Color = '#191724' } },
      { Foreground = { Color = '#e0def4' } },
      { Text = ' ' .. title .. ' ' },
    }
  end
  return ' ' .. title .. ' '
end)

return config