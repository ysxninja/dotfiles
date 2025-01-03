#!/bin/sh

killall waybar
killall bluelighttoggle

kdeconnect-cli --refresh

waybar &
hyprctl reload
