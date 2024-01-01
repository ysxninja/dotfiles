#!/bin/bash

# network-traffic.sh | vnstat-checker.sh
# Author: https://github.com/ya-suke
# Description: A script to monitor / check data usage for network interfaces
#              using vnstat.
# Dependencies: Bash, ip(iproute2), ping(iputils-ping), vnstat
# Example Usage: Polybar
# Usage: ./network-traffic.sh [up] <interface1> [<interface2> <interface3> ...]
#        e.g ./network-traffic.sh up wlo1 eth0 wlp3s0
#        or  ./network-traffic.sh wlo1 eth0
#        First argument is used, the rest is fallback,
#        when 'up' is specified, will show active internet connection usage

# Function to check for an active internet connection

check_active_interface() {
  local interfaces=()
  mapfile -t interfaces < <(ip -o link show | awk -F': ' '{print $2}')

  for interface in "${interfaces[@]}"; do
    if ip route show dev "$interface" 2>/dev/null | grep -q default; then
      # WARN: remove -I "$interface" to rely on default behaviour of the operating system
      if ping -c 1 -W 1 -I "$interface" 8.8.8.8 &>/dev/null; then
        echo "$interface"
        return 0
      fi
    fi
  done

  # DEBUG: remove comment for verbosity, might clutter window when using output in polybar
  # echo "No active interface with internet connection found."
  exit 1
}


# Check if "up" is specified as the first argument
if [ "$1" == "up" ]; then
  # If "up" is specified, use the active internet-connected interface
  active_interface=$(check_active_interface)
  today_used=$(vnstat -i "$active_interface" 2>/dev/null | awk -v iface="$active_interface" '$0 ~ iface {found=1; block=$0; next} found && /today/{print $8 " " $9; found=0} found{block = block ORS $0}')
  if [ -n "$today_used" ]; then
    echo "$today_used"
    exit 0
  fi
  # If no data for the active interface, fall through to check the next specified interface
fi

# If "up" is not specified, assume the first argument is an interface name
# or fallback to the next interfaces until a valid one is found
while [ "$#" -gt 0 ]; do
  interface="$1"
  # DEBUG:
  # echo "$interface"
  today_used=$(vnstat -i "$interface" 2>/dev/null | awk '$0 ~ /today/{print $8 " " $9}')
  if [ -n "$today_used" ]; then
    echo "$today_used"
    exit 0
  fi
  shift  # Move to the next argument
done

# FIX: Error on start with vnstat -i $interface, when no usage is detected
# DEBUG:
# echo "Vnstat error: None of the specified interfaces are valid or active."
exit 1
