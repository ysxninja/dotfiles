#!/bin/sh

# status="$(acpi -b | grep -ioh "\w*charging\w*")"
# level="$(acpi -b | grep -o -P "[0-9]\+" | head -n 1)"  # Using head to ensure we get the first match

status="$(cat /sys/class/power_supply/BAT1/status)"
level="$(cat /sys/class/power_supply/BAT1/capacity)"

if [ "$status" = "Discharging" ] || [ "$status" = "Full" ]; then
  if [ "$level" -eq 0 ]; then
    printf "󱃍 "  # Battery Empty
  elif [ "$level" -gt 0 ] && [ "$level" -le 10 ]; then
    printf "󰁺 "  # Battery 0-10% (Very Low)
  elif [ "$level" -gt 10 ] && [ "$level" -le 20 ]; then
    printf "󰁻 "  # Battery 10-20% (Low)
  elif [ "$level" -gt 20 ] && [ "$level" -le 30 ]; then
    printf "󰁼 "  # Battery 20-30% (Low)
  elif [ "$level" -gt 30 ] && [ "$level" -le 40 ]; then
    printf "󰁽 "  # Battery 30-40% (Medium Low)
  elif [ "$level" -gt 40 ] && [ "$level" -le 50 ]; then
    printf "󰁾 "  # Battery 40-50% (Medium)
  elif [ "$level" -gt 50 ] && [ "$level" -le 60 ]; then
    printf "󰁿 "  # Battery 50-60% (Medium)
  elif [ "$level" -gt 60 ] && [ "$level" -le 70 ]; then
    printf "󰂀 "  # Battery 60-70% (Medium High)
  elif [ "$level" -gt 70 ] && [ "$level" -le 80 ]; then
    printf "󰂁 "  # Battery 70-80% (High)
  elif [ "$level" -gt 80 ] && [ "$level" -le 90 ]; then
    printf "󰂂 "  # Battery 80-90% (High)
  elif [ "$level" -gt 90 ] && [ "$level" -le 100 ]; then
    printf "󰁹 "  # Battery Full
  fi
elif [ "$status" = "Charging" ]; then
  printf "󰂄 "  # Charging
elif [ "$status" = "Not charging" ]; then
  printf " "  # Plugged in but not charging
fi
