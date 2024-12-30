#!/bin/sh

killall waybar
killall hyprpaper
killall wl-gammarelay
killall bluelighttoggle

kdeconnect-cli --refresh

waybar &
hyprctl reload
