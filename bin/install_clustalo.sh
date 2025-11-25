#!/bin/bash
# ------------------------------------------------------------------
# [Shaurita Hutchins] Install Clustal Omega & Argtable2
#          This script installs Clustal Omega and Argtable2 for 64-bit linux distributions.
# ------------------------------------------------------------------

set -euo pipefail

INSTALL_DIR="/usr/local/apps"
ARGTABLE_URL="http://prdownloads.sourceforge.net/argtable/argtable2-13.tar.gz"
ARGTABLE_FILE="argtable2-13.tar.gz"
ARGTABLE_DIR="argtable2-13"

CLUSTAL_URL="http://www.clustal.org/omega/clustal-omega-1.2.4.tar.gz"
CLUSTAL_FILE="clustal-omega-1.2.4.tar.gz"
CLUSTAL_DIR="clustal-omega-1.2.4"

# Check dependencies
for cmd in wget tar make gcc; do
    if ! command -v "$cmd" &> /dev/null; then
        echo "Error: $cmd is required but not installed."
        exit 1
    fi
done

# Check permissions
if [[ ! -w "$INSTALL_DIR" ]] && [[ "$EUID" -ne 0 ]]; then
   echo "Error: You need write permissions for $INSTALL_DIR. Try running with sudo."
   exit 1
fi

if [[ ! -d "$INSTALL_DIR" ]]; then
    mkdir -p "$INSTALL_DIR"
fi

cd "$INSTALL_DIR"

# --- Install Argtable2 ---
echo "Downloading Argtable2..."
wget -c "$ARGTABLE_URL"
tar xvf "$ARGTABLE_FILE"
cd "$ARGTABLE_DIR"
echo "Configuring and compiling Argtable2..."
./configure --prefix="$INSTALL_DIR/$ARGTABLE_DIR/"
make
make install
make clean
cd "$INSTALL_DIR"

# --- Install Clustal Omega ---
echo "Downloading Clustal Omega..."
wget -c "$CLUSTAL_URL"
tar xvf "$CLUSTAL_FILE"
cd "$CLUSTAL_DIR"

echo "Configuring and compiling Clustal Omega..."
# Note: Using the installed argtable paths
./configure --prefix="$INSTALL_DIR/$CLUSTAL_DIR" \
    CFLAGS="-I$INSTALL_DIR/$ARGTABLE_DIR/include/" \
    LDFLAGS="-L$INSTALL_DIR/$ARGTABLE_DIR/lib/"

make
make install
make clean

echo "Installation complete."
echo "Clustal Omega is in: $INSTALL_DIR/$CLUSTAL_DIR/bin"
