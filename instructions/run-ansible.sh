#!/bin/bash

ANSIBLE_DIR=~/286-315-maintenance/playbooks
HISTORY_FILE=~/.ansible-playbook-history

cd $ANSIBLE_DIR || exit

# Update playbooks from GitHub
git pull origin main

# Loop through all playbooks, ensuring only new ones are applied
for playbook in $(ls *.yml | sort); do
    if ! grep -Fxq "$playbook" "$HISTORY_FILE"; then
        echo "Applying $playbook..."
        ansible-playbook "$playbook"
        if [ $? -eq 0 ]; then
            echo "$playbook" >> "$HISTORY_FILE"
        else
            echo "Failed to apply $playbook: skipping logging."
        fi
    else
        echo "$playbook already applied, skipping..."
    fi
done