#!/bin/bash
# ------------------------------------------------------------------
# [Shaurita Hutchins] download_all.sh
#          This script downloads all the scripts from the bin into the user's home bin.
#

# A function that uses wget to download the scripts
download_scripts()
{

URL=https://raw.githubusercontent.com/sdhutchins/BASHful/master/bin
echo "Downloading all scripts..."
wget -O ~/bin/compbio-project $URL/compbio-project
wget -O ~/bin/pipcleanup $URL/pipcleanup
wget -O ~/bin/install_paml.sh $URL/install_paml.sh
wget -O ~/bin/install_pal2nal.sh $URL/install_pal2nal.sh
wget -O ~/bin/install_anaconda.sh $URL/install_anaconda.sh
wget -O ~/bin/install_ncbiblast.sh $URL/install_ncbiblast.sh
wget -O ~/bin/install_clustalo.sh $URL/install_clustalo.sh
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
