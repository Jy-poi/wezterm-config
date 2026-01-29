-- Pull in the wezterm API
local wezterm = require("wezterm")
local platform = require("utils.platform")
-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 10
config.color_scheme = "AdventureTime"
config.font = wezterm.font("JetBrainsMono Nerd Font")

if platform.is_win then
	config.default_prog = { "pwsh", "-NoLogo" }
	config.launch_menu = {
		{ label = "PowerShell Core", args = { "pwsh", "-NoLogo" } },
		{ label = "PowerShell Desktop", args = { "powershell" } },
		{ label = "Command Prompt", args = { "cmd" } },
		{
			label = "Git Bash",
			args = { "C:\\Users\\jiangyu\\scoop\\apps\\git\\current\\bin\\bash.exe" },
		},
	}
end

-- Finally, return the configuration to wezterm:
return config
