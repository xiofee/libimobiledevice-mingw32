#!/bin/sh

pacman -S --noconfirm --needed \
 base-devel \
 mingw-w64-i686-toolchain \
 mingw-w64-i686-libtool \
 mingw-w64-i686-python3 \
 mingw-w64-i686-cython \
 mingw-w64-i686-python3-distlib

# pacman -Syy --noconfirm --needed \
#  base-devel \
#  mingw-w64-x86_64-toolchain \
#  mingw-w64-x86_64-libtool \
#  mingw-w64-x86_64-python3 \
#  mingw-w64-x86_64-cython \
#  mingw-w64-x86_64-python3-distlib

# libirecovery
pacman -S --noconfirm --needed mingw-w64-i686-libusb
# pacman -S --noconfirm --needed mingw-w64-x86_64-libusb

# libideviceactivation
pacman -S --noconfirm --needed mingw-w64-i686-libxml2 mingw-w64-i686-curl
# pacman -S --noconfirm --needed mingw-w64-x86_64-libxml2 mingw-w64-x86_64-curl

# ideviceinstaller
pacman -S --noconfirm --needed mingw-w64-i686-libzip
# pacman -S --noconfirm --needed mingw-w64-x86_64-libzip

ln -s /mingw32/bin/python3 /mingw32/bin/python
# ln -s /mingw64/bin/python3 /mingw64/bin/python

# libplist
cd libplist
./autogen.sh
make install
cd ..

# libusbmuxd
cd libusbmuxd
./autogen.sh
make install
cd ..

# libimobiledevice
cd libimobiledevice
./autogen.sh
make install
cd ..

# libirecovery
# if got error need format configure script
cd libirecovery
./autogen.sh
make install
cd ..

# libideviceactivation
cd libideviceactivation
./autogen.sh
make install
cd ..

# ideviceinstaller
export CFLAGS=-D__USE_MINGW_ANSI_STDIO=1
cd ideviceinstaller
./autogen.sh
make install
cd ..
unset CFLAGS

# idevicerestore
cd idevicerestore
./autogen.sh
make install
cd ..

# sbmanager
# usbmuxd
# ifuse
