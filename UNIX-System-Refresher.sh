#!/bin/bash

# Enable strict error handling
set -euo pipefail

echo "Starting system update, upgrade, and cleanup process..."

# Add current user to sudoers for specific apt operations
USER=$(whoami)
SUDOERS_ENTRY="$USER ALL=(ALL) NOPASSWD: /usr/bin/apt update, /usr/bin/apt upgrade, /usr/bin/apt autoremove"

if ! sudo grep -q "$SUDOERS_ENTRY" /etc/sudoers; then
    echo "Adding current user to sudoers for apt operations..."
    echo "$SUDOERS_ENTRY" | sudo EDITOR='tee -a' visudo
    echo "Sudoers entry added successfully."
else
    echo "Sudoers entry already exists. Skipping."
fi

# Update package lists
echo "Running apt update..."
sudo /usr/bin/apt update

# Upgrade packages
echo "Running apt upgrade..."
sudo /usr/bin/apt upgrade -y

# Remove unused packages
echo "Running apt autoremove..."
sudo /usr/bin/apt autoremove -y

echo "System maintenance completed successfully!"
exit 0
