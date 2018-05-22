#!/bin/bash
# ------------------------------------------------------------------
# [Shaurita Hutchins] Install NCBI Blast 2.7.1
#          This script installs NCBI Blast+ for 64-bit linux distributions.

# Change to install directory
cd /usr/local/apps

# Install NCBI Blast 2.7.1 binaries
wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.7.1+-x64-linux.tar.gz
tar xvf ncbi-blast-2.7.1+-x64-linux.tar.gz