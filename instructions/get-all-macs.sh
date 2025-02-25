#!/bin/bash

WORKSTATIONS=(
    "ws315-1"
    "ws315-2"
    "ws315-3"
    "ws315-4"
    "ws315-5"
    "ws315-6"
    "ws315-7"
    "ws315-8"
    "ws315-9"
    "ws315-10"
    "ws315-11"
    "ws315-12"
    "ws315-13"
    "ws315-14"
)

echo "Collecting MAC addresses from all workstations..."
for HOST in "${WORKSTATIONS[@]}"; do
    echo "Getting MAC address for $HOST..."
    ssh maintainer@$HOST "ip link show | grep 'link/ether'" | awk '{print $2}' >> mac_addresses.txt
done

echo "All MAC addresses saved in mac_addresses.txt"