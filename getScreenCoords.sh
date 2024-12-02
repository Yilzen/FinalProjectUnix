#!/bin/bash

while true;do
	resolution=$(xdotool getdisplaygeometry)
	screenWidth = $(echo $resolution | awk '{print $1}')
	screenHeight = $(oecho $resolution | awk '{print $2}')
	xdotool key Shift+Print
 	xdotool mousemove 0 0
	xdotool mousedown 1
	xdotool mousemove screenWidth screenHeight click 1
	xdotool mouseup 1
done
	
