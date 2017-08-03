#!/bin/sh

# Get GenisysPro source code for building
git clone https://github.com/GenisysPro/GenisysPro.git
# Move necessary files for building
cp Doxyfile GenisysPro/Doxyfile
cp README.md GenisysPro/README.md
cd GenisysPro
# Get Doxygen binary
wget http://ftp.stack.nl/pub/users/dimitri/doxygen-1.8.13.linux.bin.tar.gz
tar -xvf doxygen-1.8.13.linux.bin.tar.gz
cp doxygen-1.8.13/bin/doxygen doxygen
# Build documentation
./doxygen Doxyfile

if ls html/index.html >/dev/null 2>&1; then
	echo Doxygen documentation generated successfully.
else
	echo Doxygen documentation generation failed!
	exit 1
fi
