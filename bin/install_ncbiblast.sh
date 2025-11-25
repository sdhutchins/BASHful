#!/bin/bash
# ------------------------------------------------------------------
# [Shaurita Hutchins] Install NCBI Blast 2.7.1
#          This script installs NCBI Blast+ for 64-bit linux distributions.
# ------------------------------------------------------------------

set -euo pipefail

INSTALL_DIR="/usr/local/apps"
BLAST_URL="ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.7.1+-x64-linux.tar.gz"
BLAST_FILE="ncbi-blast-2.7.1+-x64-linux.tar.gz"

# Check permissions
if [[ ! -w "$INSTALL_DIR" ]] && [[ "$EUID" -ne 0 ]]; then
   echo "Error: You need write permissions for $INSTALL_DIR. Try running with sudo."
   exit 1
fi

if [[ ! -d "$INSTALL_DIR" ]]; then
    mkdir -p "$INSTALL_DIR"
fi

cd "$INSTALL_DIR"

echo "Downloading NCBI Blast..."
wget -c "$BLAST_URL"

echo "Extracting NCBI Blast..."
tar xvf "$BLAST_FILE"

echo "Installation completed in $INSTALL_DIR"
