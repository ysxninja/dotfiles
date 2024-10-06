#!/bin/sh

player_name=$(playerctl metadata --format '{{playerName}}')
player_status=$(playerctl status)

if [ "$player_status" = "Playing" ]; then
  case "$player_name" in
    spotify)
      song_info='󰓇 '
      ;;
    firefox)
      song_info='󰈹 '
      ;;
    mpd)
      song_info='󰎆 '
      ;;
    chromium | google-chrome)
      song_info='  '
      ;;
    kdeconnect)
      song_info=' 󰠕 '
      ;;
  esac
fi

echo "$song_info"
