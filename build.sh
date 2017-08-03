#!/bin/sh

git clone https://github.com/GenisysPro/GenisysPro.git
cp Doxyfile GenisysPro/Doxyfile
cd GenisysPro
wget http://ftp.stack.nl/pub/users/dimitri/doxygen-1.8.13.linux.bin.tar.gz
tar -xvf doxygen-1.8.13.linux.bin.tar.gz
cp doxygen-1.8.13/bin/doxygen doxygen
./doxygen Doxyfile

if ls html/index.html >/dev/null 2>&1; then
	echo Doxygen documentation generated successfully.
else
	echo Doxygen documentation generation failed!
	exit 1
fi
