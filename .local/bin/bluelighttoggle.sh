#!/bin/sh

# Define the DBus path, object, and interface
SERVICE="rs.wl-gammarelay"
INTERFACE="rs.wl.gammarelay"

# Get the current temperature using introspect
current_temp=$(busctl --user introspect $SERVICE / $INTERFACE | grep -E "^\.Temperature" | awk '{print $4}')

# Check the current temperature and toggle
if [ "$current_temp" -ge 6500 ]; then
    # If it's 6500K, set it to 5700K
    busctl --user -- set-property $SERVICE / $INTERFACE Temperature q 5700
elif [ "$current_temp" -le 5700 ]; then
    # If it's 5700K, set it to 6500K
    busctl --user set-property $SERVICE / $INTERFACE Temperature q 6500
else
    busctl --user set-property $SERVICE / $INTERFACE Temperature q 6500
fi
