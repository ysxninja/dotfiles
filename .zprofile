
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  # exec startx "$XINITRC"
  pgrep Hyprland || Hyprland
  # sway
fi
