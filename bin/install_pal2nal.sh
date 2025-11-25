#!/bin/bash
# ------------------------------------------------------------------
# [Shaurita Hutchins] Install PAL2NAL
#          This script installs PAL2NAL for 64-bit linux distributions.
# ------------------------------------------------------------------

set -euo pipefail

INSTALL_DIR="/usr/local/apps"
PAL2NAL_URL="http://www.bork.embl.de/pal2nal/distribution/pal2nal.v14.tar.gz"
PAL2NAL_FILE="pal2nal.v14.tar.gz"

# Check permissions
if [[ ! -w "$INSTALL_DIR" ]] && [[ "$EUID" -ne 0 ]]; then
   echo "Error: You need write permissions for $INSTALL_DIR. Try running with sudo."
   exit 1
fi

if [[ ! -d "$INSTALL_DIR" ]]; then
    mkdir -p "$INSTALL_DIR"
fi

# Store current directory to return later if needed
CWD="$(pwd)"

# Change to install directory
cd "$INSTALL_DIR"

echo "Downloading PAL2NAL..."
wget -c "$PAL2NAL_URL"

echo "Extracting PAL2NAL..."
tar xzf "$PAL2NAL_FILE"
rm "$PAL2NAL_FILE"

# Go back to starting directory (optional, but good practice if sourced)
cd "$CWD"

echo "PAL2NAL is currently installed in $INSTALL_DIR"
