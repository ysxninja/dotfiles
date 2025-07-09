#!/bin/sh

killall waybar
killall bluelighttoggle
killall hyprpaper

kdeconnect-cli --refresh

pidof waybar || nohup waybar >/dev/null 2>&1 &
pidof hyprpaper || nohup hyprpaper >/dev/null 2>&1 &
hyprctl reload

exit 0
