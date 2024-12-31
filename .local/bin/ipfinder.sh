#!/usr/bin/env sh

MAX_TIME=10 # seconds
before_network_check=2 # seconds
last_network_change=0 # seconds

DEFAULT_CHECK_ANYWAY=10 # seconds
check_anyway=$DEFAULT_CHECK_ANYWAY # seconds

VPN_UP="󰞀"
VPN_DOWN="󰦞"
INTERNET_DOWN=""
ICON=""

# Track the last known IP
last_ip=""
# Set the maximum check interval
MAX_CHECK_INTERVAL=60  # in seconds

# In case we get throttled anyway, try with a different service.
throttled() {
    response=$(curl -m "$MAX_TIME" -sf -H "Accept: application/json" trackip.net/ip?json)
    ip=$(echo "$response" | jq -r '.IP' 2>/dev/null)
    country=$(echo "$response" | jq -r '.Country' 2>/dev/null)

    if [ -z "$ip" ] || echo "$ip" | grep -iq null; then
        return 1
    fi

    return 0
}

# Improved connected function that checks for actual internet access
connected() {
    # Check if the default route exists
    default_interface=$(ip route | awk '/^default/ { print $5 ; exit }')

    if [ -z "$default_interface" ]; then
        # No default route, internet is down
        echo 1
        return 1
    fi

    # Check if the default route interface has internet access by pinging a reliable host (e.g., Google's DNS)
    if ping -c 1 -W 1 8.8.8.8 &>/dev/null; then
        # Internet is accessible
        echo 0
        return 0
    else
        # Internet is down, but the interface is still up
        echo 1
        return 1
    fi
}

interface_state() {
    ip link show up | grep -oE 'state (UP|DOWN|UNKNOWN)' | awk '{print $2}' | tr '[:space:]' ' '
}

uplinks() {
    ip link show up | awk -F: '/^[0-9]+/ {print $1}'
}

while :; do
    current_interface_state="$(interface_state)"
    current_uplinks=$(uplinks)
    current_connection_status=$(connected)

    # Check for current IP and detect if it's 127.0.0.1 (indicating internet loss)
    ip="127.0.0.1"  # Default IP fallback

    # Check the default route to see if the network is down
    default_interface=$(ip route | awk '/^default/ { print $5 ; exit }')
    if [ -z "$default_interface" ]; then
        status=$INTERNET_DOWN
        ip="127.0.0.1"  # No default route, assume internet is down
    else
        response=$(curl -m "$MAX_TIME" -sf -H "Accept: application/json" ipinfo.io/json)
        if [ -n "$response" ] && ! echo "$response" | jq -r '.ip' | grep -iq null; then
            ip=$(echo "$response" | jq -r '.ip')
            country=$(echo "$response" | jq -r '.country')
        fi
    fi

    # We do not want to exceed the limit of API requests, so we check if there is actually any changes.
    if [ "$current_interface_state" != "$previous_interface_state" ] || \
       [ "$current_uplinks" != "$previous_uplinks" ] || \
       [ "$current_connection_status" != "$previous_connection_status" ] || \
       [ "$ip" != "$last_ip" ]; then

        # Network change detected, running custom commands here on any network or IP change (including IP reverting to 127.0.0.1)
        /usr/bin/kdeconnect-cli --refresh

        # Update the last known IP address
        last_ip="$ip"

        # Reset check-anyway counter
        check_anyway=$DEFAULT_CHECK_ANYWAY
    else
        # No change detected, so increase the check_anyway time
        last_network_change=$((last_network_change + before_network_check))

        if [ "$last_network_change" -le "$check_anyway" ]; then
            # Continue checking after wait period (check_anyway)
            sleep $before_network_check
            continue
        else
            # Increase the wait period to avoid excessive checks
            check_anyway=$((check_anyway + 2 * (RANDOM % 10)))
            if [ "$check_anyway" -gt "$MAX_CHECK_INTERVAL" ]; then
                check_anyway=$MAX_CHECK_INTERVAL  # Cap the interval to prevent it from growing too large
            fi
        fi
    fi

    # Printing status
    status=$VPN_DOWN
    if ip tuntap | grep -iEq '(proton|tun)[0-9]+|nordlynx' || ip link | grep -iEq 'mullvad|wgpia[0-9]+'; then
        status=$VPN_UP
        ICON="󰞀"
    else
        ICON=""
    fi

    # printf "%-23s\n" "$(echo $status $ip [$country])"
    # Json output, text, alt, tooltip, class, percentage
    # printf "%-23s\n" "$(echo \{\"text\":\"$status\", \"alt\":\" \", \"tooltip\":\"Vpn Status and Ip Info $status'\\n\\n'["$country"] :: "$ip"\", \"location\":\"["$country"]\"\})"
    printf "%-23s\n" "$(echo \{\"text\":\"" $ICON " "$ip"\", \"alt\":\" $ICON \", \"tooltip\":\"Vpn Status and Ip Info '\n'"$status " :: "$ip" :: ["$country"]\", \"location\":\"["$country"]\"\})"

    previous_interface_state="$(interface_state)"
    previous_uplinks=$(uplinks)
    previous_connection_status=$(connected)
done
