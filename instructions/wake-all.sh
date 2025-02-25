#!/bin/bash

WORKSTATIONS=(
    "00:1A:2B:3C:4D:5E"
    "00:1A:2B:3C:4D:5F"
    "00:1A:2B:3C:4D:60"
    "00:1A:2B:3C:4D:61"
)

echo "Waking up all workstations..."
for MAC in "${WORKSTATIONS[@]}"; do
    wakeonlan $MAC
done

echo "All workstations should be waking up now."