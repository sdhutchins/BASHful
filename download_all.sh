#!/bin/bash
# ------------------------------------------------------------------
# [Shaurita Hutchins] download_all.sh
#          This script downloads all the scripts from the bin into the user's home bin.
#

# A function that uses wget to download the scripts
download_scripts()
{
echo "Downloading all scripts..."
wget -O ~/bin/compbio-project https://raw.githubusercontent.com/sdhutchins/BASHful/master/bin/compbio-project
wget -O ~/bin/pipcleanup https://raw.githubusercontent.com/sdhutchins/BASHful/master/bin/pipcleanup
wget -O ~/bin/install_paml.sh https://raw.githubusercontent.com/sdhutchins/BASHful/master/bin/install_paml.sh
wget -O ~/bin/install_pal2nal.sh https://raw.githubusercontent.com/sdhutchins/BASHful/master/bin/install_pal2nal.sh
wget -O ~/bin/install_anaconda.sh https://raw.githubusercontent.com/sdhutchins/BASHful/master/bin/install_anaconda.sh
wget -O ~/bin/install_ncbiblast.sh https://raw.githubusercontent.com/sdhutchins/BASHful/master/bin/install_ncbiblast.sh
wget -O ~/bin/install_clustalo.sh https://raw.githubusercontent.com/sdhutchins/BASHful/master/bin/install_clustalo.sh
echo "Scripts have finished downloading."
}

DIR="$HOME/bin"

if [ -d "$DIR" ]; then
        download_scripts
        chmod +x "$DIR"/*
else [ ! -d "$DIR" ]
        echo "Creating $DIR"
        mkdir "$DIR"
        download_scripts
        chmod +x "$DIR"/*
fi