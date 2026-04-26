
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  # exec startx "$XINITRC"
  pgrep start-hyprland || start-hyprland
  # sway
fi
