#!/bin/sh

killall waybar
killall hyprpaper
killall wl-gammarelay

kdeconnect-cli --refresh

waybar &
hyprctl reload
