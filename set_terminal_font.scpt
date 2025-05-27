tell application "Terminal"
	set defaultSettings to settings set "Basic"

	set font name of defaultSettings to "MesloLGS Nerd Font"
	set font size of defaultSettings to 14

	-- Also update open tabs using the same profile
	repeat with aTab in tabs of windows
		if current settings of aTab is defaultSettings then
			set current settings of aTab to defaultSettings
		end if
	end repeat
end tell