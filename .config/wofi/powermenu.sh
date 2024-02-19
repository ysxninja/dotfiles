#!/bin/bash

entries=" Lock\n󰍃 Logout\n Suspend\n Reboot\n Shutdown"

selected=$(echo -e "$entries" | wofi --conf="$HOME"/.config/wofi/config-powermenu | awk '{print tolower($1)}')

case $selected in
  0)
    swaylock;;
  1)
    loginctl terminate-user "$(whoami)";;
  2)
    exec systemctl suspend;;
  3)
    exec systemctl reboot;;
  4)
    exec systemctl poweroff -i;;
esac
