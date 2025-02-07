# System Refresher Script

This script automates the essential maintenance tasks of a Debian-based Linux system. It updates package lists, upgrades installed packages, and removes unnecessary ones. Additionally, it ensures that the current user has passwordless sudo access for these specific operations, simplifying repeated usage.

## Features
- **Strict Error Handling**: The script uses `set -euo pipefail` to terminate on any error, ensuring reliability.
- **Passwordless Sudo Configuration**: Automatically adds the current user to the sudoers file for:
  - `/usr/bin/apt update`
  - `/usr/bin/apt upgrade`
  - `/usr/bin/apt autoremove`
- **Core Maintenance Operations**:
  - Updates package lists.
  - Upgrades installed packages.
  - Removes unused packages.

## Prerequisites
- The script must be run with `sudo` privileges to modify the sudoers file.
- Compatible with Debian-based systems.

## Usage
1. Clone the repository or download the script.
   ```bash
   git clone https://github.com/Daniel-Brodsky/UNIX-System-Refresher
   cd UNIX-System-Refresher
   ```
2. Make the script executable:
   ```bash
   chmod +x system_refresher.sh
   ```
3. Run the script:
   ```bash
   ./system_refresher.sh
   ```

## How It Works
1. **Passwordless Sudo Configuration**:
   - The script checks if the current user is already in the sudoers file with the necessary permissions.
   - If not, it appends the following entry:
     ```
     <USERNAME> ALL=(ALL) NOPASSWD: /usr/bin/apt update, /usr/bin/apt upgrade, /usr/bin/apt autoremove
     ```
2. **System Maintenance**:
   - Executes the following commands:
     - `apt update`: Refreshes package lists.
     - `apt upgrade`: Upgrades installed packages to their latest versions.
     - `apt autoremove`: Removes unused dependencies and packages.

## Notes
- Ensure you have `sudo` privileges before running the script.
- Review the sudoers file modification logic to ensure compliance with your system policies.
