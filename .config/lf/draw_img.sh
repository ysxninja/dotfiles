#!/bin/sh
if [ -n "$FIFO_UEBERZUG" ]; then
	path="$(printf '%s' "$1" | sed 's/\\/\\\\/g;s/"/\\"/g')"
	window_info=$(hyprctl activewindow)

	# checkclass=$(echo "$window_info" | awk '/class/ {print $2}')
	floating=$(echo "$window_info" | awk '/floating:/ {print $2}')
	location=$(echo "$window_info" | awk '/at:/ {print $2}')

	if [ "$floating" = "1" ] && [ "$location" != "0,0" ]; then
		exiftool "$1"
	else
		printf '{"action": "add", "identifier": "preview", "x": %d, "y": %d, "width": %d, "height": %d, "scaler": "fit_contain", "scaling_position_x": 0.5, "scaling_position_y": 0.5, "path": "%s"}\n' \
			"$(($4 * 80 / 100))" "$5" "$(($2 * 50 / 100))" "$3" "$1" >"$FIFO_UEBERZUG"
	fi

fi
