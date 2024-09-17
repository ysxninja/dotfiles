#!/bin/sh

wp_dir=$HOME/wallpapers
conf_dir=$HOME/.config/hypr
# Pick random wallpaper
random_pick=$(find "$wp_dir" -type f -name "*.png" -o -name "*.jpg" | shuf -n1)
# Replace the placeholder in template and save to .conf file
sed -e "s~<wp>~${random_pick}~g" "$conf_dir"/scripts/hyprpaper.template > "$conf_dir"/hyprpaper.conf
