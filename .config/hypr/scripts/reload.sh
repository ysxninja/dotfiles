#!/bin/sh

killall waybar
killall hyprpaper

"$HOME"/.config/hypr/scripts/pick_wallpaper.sh
waybar &
hyprpaper &

hyprctl reload
