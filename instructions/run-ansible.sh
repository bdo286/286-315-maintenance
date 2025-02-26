#!/bin/bash

ANSIBLE_DIR=~/286-315-maintenance/playbooks
INVENTORY_FILE=~/286-315-maintenance/inventory.ini
HISTORY_FILE=~/.ansible-playbook-history

cd "$ANSIBLE_DIR" || exit

# Ensure history file exists
touch "$HISTORY_FILE"

# Update playbooks from GitHub
echo "Updating playbooks from GitHub..."
git pull origin main

# Loop through all playbooks, ensuring only new ones are applied
for playbook in $(ls *.yml | sort); do
    if ! grep -Fxq "$playbook" "$HISTORY_FILE"; then
        echo "Applying $playbook with sudo..."
        sudo ansible-playbook -i "$INVENTORY_FILE" "$playbook"
        
        if [ $? -eq 0 ]; then
            echo "$playbook" >> "$HISTORY_FILE"
            echo "$playbook successfully applied."
        else
            echo "Failed to apply $playbook: skipping logging."
        fi
    else
        echo "$playbook already applied, skipping..."
    fi
done