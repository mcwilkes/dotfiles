-- Pull in WezTerm API
local wezterm = require("wezterm")

-- Utility functions
local window_background_opacity = 0.75
local function toggle_window_background_opacity(window)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_background_opacity then
		overrides.window_background_opacity = 1.0
	else
		overrides.window_background_opacity = nil
	end
	window:set_config_overrides(overrides)
end
wezterm.on("toggle-window-background-opacity", toggle_window_background_opacity)

local function toggle_ligatures(window)
	local overrides = window:get_config_overrides() or {}
	if not overrides.harfbuzz_features then
		overrides.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
	else
		overrides.harfbuzz_features = nil
	end
	window:set_config_overrides(overrides)
end
wezterm.on("toggle-ligatures", toggle_ligatures)

-- Returns color scheme dependant on operating system theme setting (dark/light)
local function color_scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Tokyo Night"
	else
		return "Tokyo Night"
	end
end

-- Initialize actual config
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Appearance
config.font_size = 14.0

config.initial_rows = 40
config.initial_cols = 100

config.adjust_window_size_when_changing_font_size = false
config.color_scheme = color_scheme_for_appearance(wezterm.gui.get_appearance())
config.window_background_opacity = window_background_opacity
-- config.macos_window_background_blur = 10
config.window_decorations = "RESIZE"
-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.native_macos_fullscreen_mode = false

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
config.show_new_tab_button_in_tab_bar = true

-- options
config.window_close_confirmation = "NeverPrompt"

-- Keybindings
config.keys = {
	-- Default QuickSelect keybind (CTRL-SHIFT-Space) gets captured by something
	-- else on my system
	{
		key = "A",
		mods = "CTRL|SHIFT",
		action = wezterm.action.QuickSelect,
	},
	{
		key = "O",
		mods = "CTRL|SHIFT",
		action = wezterm.action.EmitEvent("toggle-window-background-opacity"),
	},
	{
		key = "E",
		mods = "CTRL|SHIFT",
		action = wezterm.action.EmitEvent("toggle-ligatures"),
	},
	-- Quickly open config file with common macOS keybind
	{
		key = ",",
		mods = "SUPER",
		action = wezterm.action.SpawnCommandInNewWindow({
			cwd = os.getenv("WEZTERM_CONFIG_DIR"),
			args = { os.getenv("SHELL"), "-c", "$VISUAL $WEZTERM_CONFIG_FILE" },
		}),
	},
}

-- Return config to WezTerm
return config
