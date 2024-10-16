#!/bin/sh

killall waybar
killall hyprpaper
killall swaync
kdeconnect-cli --refresh

"$HOME"/.config/hypr/scripts/pick_wallpaper.sh
waybar &
hyprpaper &
swaync &

hyprctl reload
