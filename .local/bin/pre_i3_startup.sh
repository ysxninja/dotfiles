#!/bin/bash

# Called before workspaces are set, and before polybar, launch.sh is called 
# Helps when setting workspaces
# Set your default monitor name
DEFAULT_MONITOR="LVDS1"

# Check if VGA1 is disconnected
if xrandr | grep "VGA1 disconnected"; then
    FM=$DEFAULT_MONITOR
else
    FM="VGA1"
fi

# Export the FM variable for later use in i3 configuration
export FM
