#!/bin/bash

check_package() {
	dpkg -1 | grep -q "opencv-python"
}

if check_package "opencv-python"; then
	echo "opencv-python is already intalled."
else
	echo "opencv-python is not installed. Installing now."
	sudo apt update -y
	sudo apt install -y opencv-python
	
	if check_package "opencv-python"; then
		echo "opencv-python installed successfully."
	else
		echo "Install failed. Install manually."
		exit 1
	fi
fi