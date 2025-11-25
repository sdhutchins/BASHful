#!/bin/bash
# ------------------------------------------------------------------
# [Shaurita Hutchins] Install PAML
#          This script installs PAML for 64-bit linux distributions.
# ------------------------------------------------------------------

set -euo pipefail

INSTALL_DIR="/usr/local/apps"
PAML_URL="http://abacus.gene.ucl.ac.uk/software/paml4.9g.tgz"
PAML_FILE="paml4.9g.tgz"
PAML_DIR="paml4.9g"

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

echo "Downloading PAML..."
wget -c "$PAML_URL"

echo "Extracting PAML..."
tar xzf "$PAML_FILE"

if [[ -d "$PAML_DIR" ]]; then
    cd "$PAML_DIR"
    
    # Clean up windows executables if they exist
    rm -f bin/*.exe
    
    cd src
    echo "Compiling PAML..."
    make -f Makefile
    
    # Verify compilation produced output (basic check)
    if [[ ! -f baseml ]]; then
        echo "Error: Compilation may have failed. 'baseml' not found."
        exit 1
    fi

    echo "Cleaning up object files..."
    rm -f ./*.o
    
    echo "Moving binaries to bin/..."
    mv baseml basemlg codeml pamp evolver yn00 chi2 ../bin/
    
    cd ..
    echo "PAML installed successfully. Binaries are in $INSTALL_DIR/$PAML_DIR/bin"
    ls -lF bin
else
    echo "Error: Directory $PAML_DIR not found after extraction."
    exit 1
fi
