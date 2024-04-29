-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Determine if linux or not
local is_linux = function()
	return wezterm.target_triple:find("linux") ~= nil
end

-- This is where you actually apply your config choices
-- For example, changing the color scheme:
local my_rose_pine = wezterm.color.get_builtin_schemes()['rose-pine']
my_rose_pine.selection_bg = '#5e5e5e'

config.color_schemes = {
  ['my-rose-pine'] = my_rose_pine
}
config.color_scheme = 'my-rose-pine'

if is_linux() then
  config.default_prog = { '/usr/bin/fish', '-l' }
else
  config.default_prog = { 'pwsh.exe' }
end

-- and finally, return the configuration to wezterm
return config
