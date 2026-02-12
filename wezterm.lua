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
config.font = wezterm.font("0xProto Nerd Font")

-- remove title bar
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
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

config.keys = {
	{
		key = "c",
		mods = "CTRL",
		action = wezterm.action.Multiple({
			wezterm.action.CopyTo("Clipboard"),
			wezterm.action.ClearSelection,
		}),
	},

	-- 【新增】从剪贴板粘贴文本
	{
		key = "v",
		mods = "CTRL",
		action = wezterm.action.PasteFrom("Clipboard"),
	},

	-- 【自定义】将 CTRL+SHIFT+C 设置为新的“强制中断”信号
	-- "\x03" 是 Ctrl+C 在终端里实际发送的控制代码 (称为 ETX)
	{
		key = "c",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SendString("\x03"),
	},
}

-- Finally, return the configuration to wezterm:
return config
