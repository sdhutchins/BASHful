#!/bin/bash
# ------------------------------------------------------------------
# [Shaurita Hutchins] Install PAL2NAL
#          This script installs PAL2NAL for 64-bit linux distributions.

# Change to install directory
cd /usr/local/apps

# Install PAL2NAL using its tar.gz
# PAL2NAL is a perl script so there is no compilation needed
wget http://www.bork.embl.de/pal2nal/distribution/pal2nal.v14.tar.gz
tar xzf pal2nal.v14.tar.gz