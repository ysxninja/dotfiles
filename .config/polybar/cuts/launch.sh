#!/usr/bin/env bash

# Specify the location of the pre-i3 startup script
# Retrieve value of $FM
PRE_I3_SCRIPT="/home/yasuke/.local/bin/pre_i3_startup.sh"

# Check if the pre-i3 script exists and is readable
if [ -f "$PRE_I3_SCRIPT" ] && [ -r "$PRE_I3_SCRIPT" ]; then
    # Source the pre-i3 startup script to set FM variable
    # shellcheck disable=1090
    source "$PRE_I3_SCRIPT"
else
    echo "Error: Pre-i3 startup script not found or not readable"
    exit 1
fi

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/cuts"

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# The $FM variable is either VGA1(if on) or LVDS1(default)
laptop=LVDS1
vga=VGA1
vga_status=$(xrandr | grep "VGA1 connected")

# Touch temp log files / create if they dont exist
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

if [ -n "$vga_status" ]; then
  # VGA monitor is connected
  # # Launch external-bar and laptop-bar for dual monitor setup
  # Xrandr organise displays, FM(VGA1) to the right of LVDS1
  xrandr --output $laptop --auto --right-of "$FM"

  # Move workspaces to FM (VGA1)
  i3-msg "workspace 1, move workspace to output $FM"
  i3-msg "workspace 2, move workspace to output $FM"
  polybar -q external-bar -c "$DIR"/config.ini 2>&1 | tee -a /tmp/polybar1.log & disown
  polybar -q laptop-bar -c "$DIR"/config.ini 2>&1 | tee -a /tmp/polybar2.log & disown

  # Nitrogen set wallpapers
  nitrogen --set-zoom-fill --random ~/.config/wallpaper --head=0
  nitrogen --set-zoom-fill ~/.config/wallpaper/0306.jpg --head=1

else
  # VGA monitor is disconnected, move workspaces to FM(LVDS1)
  # # Launch laptopwithout-bar for single monitor setup
  # Configure monitors and move workspaces to FM(LVDS1)
  xrandr --output "$laptop" --auto --primary --output $vga --off
  i3-msg "workspace 1, move workspace to output $FM"
  i3-msg "workspace 2, move workspace to output $FM"
  polybar -q laptopwithout-bar -c "$DIR"/config.ini 2>&1 | tee -a /tmp/polybar2.log & disown

  # Set random wallpaper
  change-wallpaper ~/.config/wallpaper 21600

fi

echo "Bars launched..."
