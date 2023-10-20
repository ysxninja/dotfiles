#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/cuts"

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch the bar
# polybar -q top -c "$DIR"/config.ini &
# polybar -q bottom -c "$DIR"/config.ini &

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar -q external-bar -c "$DIR"/config.ini 2>&1 | tee -a /tmp/polybar1.log & disown
polybar -q laptop-bar -c "$DIR"/config.ini 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
