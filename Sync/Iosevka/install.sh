#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

mkdir -p /usr/share/fonts/truetype/Iosevka
install -m644 Iosevka*ttf /usr/share/fonts/truetype/Iosevka
fc-cache -fv
