#!/bin/bash
# ------------------------------------------------------------------
# [Shaurita Hutchins] Install PAML
#          This script installs PAML for 64-bit linux distributions.

# Change to install directory
cd /usr/local/apps

# Install PAML from source
wget http://abacus.gene.ucl.ac.uk/software/paml4.9g.tgz
tar xzf paml4.9g.tgz
cd paml4.9g
rm bin/*.exe
cd src
make -f Makefile
ls -lF
rm *.o
mv baseml basemlg codeml pamp evolver yn00 chi2 ../bin
cd ..
ls -lF bin
bin/baseml
bin/codeml
bin/evolver
