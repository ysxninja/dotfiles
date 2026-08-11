---@module 'hl'
-- Autostart
-- exec-once = command will execute only on launch
-- exec = command will execute on each reload
-- exec-shutdown = command will execute only on shutdown
-- exec-once = $HOME/.config/hypr/scripts/pick_wallpaper.sh; hyprpaper
-- exec-once = easyeffects --gapplication-service
-- exec-once = keyd-application-mapper -d

-- Autostart
hl.on("hyprland.start", function()
	hl.exec_cmd(os.getenv("HOME") .. "/.config/hypr/xdg-portal-hyprland")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user restart mpd.service")
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
	hl.exec_cmd("pypr")
	hl.exec_cmd("blueman-applet")
	hl.exec_cmd("nm-applet --indicator")
	hl.exec_cmd("copyq --start-server")
	hl.exec_cmd("udiskie")
	hl.exec_cmd("fusuma")
	hl.exec_cmd("waybar")
	hl.exec_cmd("hypridle")
	hl.exec_cmd(os.getenv("HOME") .. "/.local/bin/tmux-sessions")
	hl.exec_cmd("/usr/bin/kdeconnectd")
	hl.exec_cmd("/usr/bin/kdeconnect-indicator")
	hl.exec_cmd("brightnessctl s +0.1%")
	hl.exec_cmd("avizo-service")
	hl.exec_cmd(
		"anacron -t/home/"
			.. os.getenv("USER")
			.. "/.local/etc/anacrontab -S/home/"
			.. os.getenv("USER")
			.. "/.local/.var/spool/anacron"
	)
	hl.exec_cmd("hyprsunset -t 5700")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("sleep 2; hyprctl reload")
end)
