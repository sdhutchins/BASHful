#!/bin/bash
# ------------------------------------------------------------------
# [Shaurita Hutchins] Install Anaconda3
#          This script installs Anaconda3 for 64-bit linux distributions.

# Change to install directory
cd /usr/local/apps

# Download the latest anaconda bash script for Linux
wget https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh

# Run the bash script
bash Anaconda3-5.1.0-Linux-x86_64.sh
