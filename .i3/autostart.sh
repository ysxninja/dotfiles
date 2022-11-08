#!/bin/sh

# compositor
killall picom
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom --config ~/.config/picom.conf --experimental-backends --vsync &

# ~/.config/polybar/launch.sh &

# setxkbmap -option ctrl:nocaps &
#setxkbmap -layout colemak &

# [ ! -s ~/.config/mpd/pid ] && mpd &
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# /usr/lib/polkit-kde-authentication-agent-1 &

#sxhkd
# sxhkd -c $HOME/myrepo/i3/sxhkd/sxhkdrc &
