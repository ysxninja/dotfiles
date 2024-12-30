#!/bin/sh

killall waybar
killall hyprpaper
killall bluelighttoggle

kdeconnect-cli --refresh

waybar &
hyprctl reload
