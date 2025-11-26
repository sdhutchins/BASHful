#!/bin/bash
# ------------------------------------------------------------------
# [Shaurita Hutchins] download_all.sh
# Downloads a set of Bash scripts into the user's ~/bin directory.
# ------------------------------------------------------------------

set -euo pipefail

# Check for wget availability before proceeding
if ! command -v wget &> /dev/null; then
    echo "Error: wget is required but not installed." >&2
    exit 1
fi

# This function downloads the scripts from the specified URLs.
download_scripts() {
    # Base URL for the raw files in the GitHub repository
    BASE_URL="https://raw.githubusercontent.com/sdhutchins/BASHful/main/bin"
    DEST_DIR="$HOME/bin"

    echo "Starting download of BASHful scripts to $DEST_DIR..."

    # Download each script from the repository to the destination directory
    wget -O "$DEST_DIR/cbproj"               "$BASE_URL/cbproj"
    wget -O "$DEST_DIR/doc2md"               "$BASE_URL/doc2md"
    wget -O "$DEST_DIR/extract-pdfs"         "$BASE_URL/extract-pdfs"
    wget -O "$DEST_DIR/getuser"              "$BASE_URL/getuser"
    wget -O "$DEST_DIR/install_anaconda.sh"  "$BASE_URL/install_anaconda.sh"
    wget -O "$DEST_DIR/install_clustalo.sh"  "$BASE_URL/install_clustalo.sh"
    wget -O "$DEST_DIR/install_ncbiblast.sh" "$BASE_URL/install_ncbiblast.sh"
    wget -O "$DEST_DIR/install_pal2nal.sh"   "$BASE_URL/install_pal2nal.sh"
    wget -O "$DEST_DIR/install_paml.sh"      "$BASE_URL/install_paml.sh"
    wget -O "$DEST_DIR/mandel"               "$BASE_URL/mandel"
    wget -O "$DEST_DIR/mk-cgds-box-proj"     "$BASE_URL/mk-cgds-box-proj"
    wget -O "$DEST_DIR/mk-tutorial"          "$BASE_URL/mk-tutorial"
    wget -O "$DEST_DIR/pipcleanup"           "$BASE_URL/pipcleanup"
    wget -O "$DEST_DIR/rmdsstore"            "$BASE_URL/rmdsstore"

    echo "All scripts downloaded to $DEST_DIR."
}

# Create variable for the bin directory
BIN_DIR="$HOME/bin"

# Check if the bin directory exists to determine if creation is needed
if [ -d "$BIN_DIR" ]; then
    echo "$BIN_DIR already exists. Proceeding with script download..."
    download_scripts
    # Make all downloaded scripts executable so they can be run immediately
    echo "Making scripts executable..."
    chmod +x "$BIN_DIR"/*
else
    # If the bin directory does not exist, create it first
    echo "$BIN_DIR not found. Creating it now..."
    mkdir -p "$BIN_DIR"
    download_scripts
    # Make all downloaded scripts executable so they can be run immediately
    echo "Making scripts executable..."
    chmod +x "$BIN_DIR"/*
fi
