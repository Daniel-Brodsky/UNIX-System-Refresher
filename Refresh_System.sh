#!/bin/bash

# Enable strict error handling
set -euo pipefail

echo "Starting system update, upgrade, and cleanup process..."

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
