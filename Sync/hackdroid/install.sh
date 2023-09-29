#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

mkdir -p /usr/share/fonts/truetype/hack-droid
install -m644 HackDroid*ttf /usr/share/fonts/truetype/hack-droid
fc-cache -fv
