#!/bin/bash

entries=" Shutdown\n Suspend\n Reboot\n󰍃 Logout\n Lock"

selected=$(echo -e "$entries" | wofi --conf="$HOME"/.config/wofi/config-powermenu | awk '{print tolower($1)}')

case $selected in
  0)
    exec systemctl poweroff -i;;
  1)
    exec systemctl suspend;;
  2)
    exec systemctl reboot;;
  3)
    loginctl terminate-user "$(whoami)";;
  4)
    swaylock;;
esac
