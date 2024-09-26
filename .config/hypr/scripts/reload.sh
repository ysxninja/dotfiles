#!/bin/sh

killall waybar
killall hyprpaper
kdeconnect-cli --refresh

"$HOME"/.config/hypr/scripts/pick_wallpaper.sh
waybar &
hyprpaper &

hyprctl reload
