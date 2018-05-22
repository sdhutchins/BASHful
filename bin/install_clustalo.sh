#!/bin/bash
# ------------------------------------------------------------------
# [Shaurita Hutchins] Install Clustal Omega & Argtable2
#          This script installs Clustal Omega and Argtable2 for 64-bit linux distributions.

# Change to install directory
cd /usr/local/apps

# First install argtable2
wget http://prdownloads.sourceforge.net/argtable/argtable2-13.tar.gz
tar xvf argtable2-13.tar.gz
cd argtable2-13/
./configure --prefix=/usr/local/apps/argtable2-13/
make
make install
make clean

# Go back to apps dir
cd /usr/local/apps

# Install the latest clustal omega binary into your bin
wget http://www.clustal.org/omega/clustal-omega-1.2.4.tar.gz
tar xvf clustal-omega-1.2.4.tar.gz
cd clustal-omega-1.2.4/
./configure --prefix=/usr/local/apps/clustal-omega-1.2.4 CFLAGS='-I/usr/local/apps/argtable2-13/include/' LDFLAGS='-L/usr/local/apps/argtable2-13/lib/'
make
make install
make clean