#!/bin/sh

killall waybar

waybar &

hyprctl reload
