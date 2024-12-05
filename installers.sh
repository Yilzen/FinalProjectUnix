#!/bin/bash

sudo apt update

if ! dpkg -l | grep -q xdotool; then
    sudo apt install -y xdotool
else
    echo "xdotool is already installed."
fi

if ! dpkg -1 | grep -q xbindkeys; then
     sudo apt install -y xbindkeys
else
    echo "xbindkeys is already installed."
fi

if ! dpkg -l | grep -q steam-installer; then
     sudo dpkg --add-architecture i386
     sudo apt update
     sudo apt install wget
     wget wget https://steamcdn-a.akamaihd.net/client/installer/steam.deb
     sudo dpkg -i steam.deb
     sudo apt install -f
     steam --version
else
    echo "Steam is already installed."
fi

if ! dpkg -l | grep -q python3; then
    sudo apt install -y python3
fi

if ! dpkg -l | grep -q python3-pip; then
    sudo apt install -y python3-pip
fi

if ! python3 -c "import cv2" &> /dev/null; then
    sudo apt install -y python3-opencv
else
    echo "opencv-python is already installed."
fi

if ! dpkg -l | grep -q scrot; then
    sudo apt install -y scrot
else
    echo "scrot is already installed."
fi

scrot '/path/to/Screenshot.png'

echo "Script execution completed."
