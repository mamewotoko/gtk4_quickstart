#! /bin/bash
. ./env.sh

if [ "$UNAME" = Darwin ]; then
    brew update
    brew install gtk4
    # make gcc pkg-config
elif [ -f /etc/lsb-release ]; then
    # Ubuntu 21.04 (not 20.04)
    sudo apt-get update
    sudo apt-get install -y libgtk-4-dev pkg-config \
         make gcc
    # install xvfb for testing
    # sudo apt-get install xvfb

# elif [ -f /etc/redhat-release ] && grep "release 7" /etc/redhat-release; then
#     sudo yum install -y gcc gobject-introspection-devel \
#          pkg-config gtk3 make

elif [[ "$UNAME" == "MINGW64_NT"* ]]; then
    # msys2 on PC
    # pacman -Syu --noconfirm
    pacman -Sy --noconfirm mingw-w64-x86_64-gtk4 \
           mingw-w64-x86_64-make \
           mingw-w64-x86_64-gcc \
           mingw-w64-x86_64-pkg-config

# elif [[ "$UNAME" == "MSYS_NT"* ]]; then
#     # travis
#     $msys2 pacman -Syu --noconfirm
#     $msys2 pacman -Sy --noconfirm mingw-w64-x86_64-gtk3 \
#            mingw-w64-x86_64-make \
#            mingw-w64-x86_64-gcc \
#            mingw-w64-x86_64-pkg-config
fi
