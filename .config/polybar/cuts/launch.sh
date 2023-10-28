#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/cuts"

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# The $FM variable is either VGA1(if on) or LVDS1(default)
laptop1=LVDS1
external1=VGA1
laptop2=eDP1
external1_status=$(xrandr | grep "$external1 connected")
laptop1_status=$(xrandr | grep "$laptop1 connected")
laptop2_status=$(xrandr | grep "$laptop2 connected")

# Touch temp log files / create if they dont exist
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

if [ -n "$external1_status" ]; then
  # VGA monitor is connected
  # Launch external-bar and laptop-bar for dual monitor setup
  # NOTE: there is no xrandr --on option, only the --auto option to redetect displays
  xrandr --output $external1 --auto
  # Xrandr organise displays, external1(VGA1) to the right of laptop(LVDS1)
  xrandr --output $laptop1 --auto --right-of "$external1"

  # Move workspaces to FM (VGA1)
  polybar -q external-bar -c "$DIR"/config.ini 2>&1 | tee -a /tmp/polybar1.log & disown
  polybar -q laptop-bar -c "$DIR"/config.ini 2>&1 | tee -a /tmp/polybar2.log & disown

  # Nitrogen set wallpapers
  nitrogen --set-zoom-fill --random ~/.config/wallpaper --head=0
  nitrogen --set-zoom-fill ~/.config/wallpaper/0306.jpg --head=1

elif [ -n "$laptop1_status" ]; then
  # VGA monitor is disconnected, move workspaces to laptop(LVDS1)
  # Launch laptopwithout-bar for single monitor setup
  # Configure monitors and move workspaces to laptop(LVDS1)
  # xrandr --output $laptop --auto --primary --output $external1 --off
  xrandr --output $laptop1 --auto --primary --output
  polybar -q laptopwithout-bar -c "$DIR"/config.ini 2>&1 | tee -a /tmp/polybar2.log & disown

  # Set random wallpaper
  change-wallpaper ~/.config/wallpaper 21600

elif [ -n "$laptop2_status" ]; then
  # laptop 2 hdd swap
  # When laptop 2 is connected
  xrandr --output $laptop2 --auto --primary --output
  polybar -q laptop2without-bar -c "$DIR"/config.ini 2>&1 | tee -a /tmp/polybar2.log & disown

  # Set random wallpaper
  change-wallpaper ~/.config/wallpaper 21600
else
  # When not connected
  echo "No monitors detected" | tee -a /tmp/polybar1.log /tmp/polybar2.log
fi

echo "Bars launched..."
