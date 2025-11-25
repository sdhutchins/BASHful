#!/bin/bash
# ------------------------------------------------------------------
# [Shaurita Hutchins] Install Anaconda3
#          This script installs Anaconda3 for 64-bit linux distributions.
# ------------------------------------------------------------------

set -euo pipefail

# Define variables
INSTALL_DIR="/usr/local/apps"
# Check if latest version link is valid or use a specific version. 
# Note: The original script used an older version (5.1.0). You might want to update this url.
ANACONDA_URL="https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh"
SCRIPT_NAME="Anaconda3-5.1.0-Linux-x86_64.sh"

# Check for root/sudo permissions if writing to /usr/local/apps
if [[ ! -w "$INSTALL_DIR" ]] && [[ "$EUID" -ne 0 ]]; then
   echo "Error: You need write permissions for $INSTALL_DIR. Try running with sudo."
   exit 1
fi

# Create directory if it doesn't exist
if [[ ! -d "$INSTALL_DIR" ]]; then
    echo "Creating directory $INSTALL_DIR..."
    mkdir -p "$INSTALL_DIR"
fi

# Change to install directory
cd "$INSTALL_DIR"

echo "Downloading Anaconda..."
# Use wget with -c to continue partially downloaded files
wget -c "$ANACONDA_URL"

echo "Installing Anaconda..."
# Run the bash script
bash "$SCRIPT_NAME"

echo "Installation script completed."
