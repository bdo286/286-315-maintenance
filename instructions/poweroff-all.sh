#!/bin/bash

# List of workstation hostnames (or IP addresses)
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

echo "Shutting down all workstations..."

for HOST in "${WORKSTATIONS[@]}"; do
    echo "Powering off $HOST..."
    ssh -o BatchMode=yes maintainer@$HOST "shutdown -h now" &
done

echo "All workstations should be shutting down now."