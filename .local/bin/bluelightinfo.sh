#!/bin/sh

# Get introspect info from wl-gammarelay
output=$(busctl --user introspect rs.wl-gammarelay / rs.wl.gammarelay)  

# Format for JSON, escaping newlines for Waybar
# Extract Brightness and Temperature values
brightness=$(echo "$output" | grep -E "^\.Brightness" | awk '{print $4}')
temperature=$(echo "$output" | grep -E "^\.Temperature" | awk '{print $4}')

# Format for JSON, escaping newlines for Waybar
# formatted_output=$(echo "$output" | sed ':a;N;$!ba;s/\n/\\n/g')
#
# Format the output for Waybar with line breaks
formatted_output="Brightness: $brightness\nTemperature: $temperature"

# Output as JSON for Waybar, escaping newlines
echo "{\"text\": \"\", \"tooltip\": \"$formatted_output\"}"
