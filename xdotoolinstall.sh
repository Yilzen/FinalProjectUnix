#!/bin/bash

check_package() {
	dpkg -1 | grep -q "xdotool"
}

if check_package "xdotool"; then
    	echo "xdotool is already installed."
else
    	echo "xdotool is not installed. Installing now."
    	sudo apt update -y
    	sudo apt install -y xdotool

    if check_package "xdotool"; then
        	echo "xdotool installed successfully."
    else
        	echo "Install failed. Install manually."
        	exit 1
    fi
fi
