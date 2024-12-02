#!/bin/bash

template_dir="$(dirname "$0")/images"

take_screenshot() {
    scrot "$1.png"
}

click_at() {
    xdotool mousemove $1 $2 click 1
}

search_and_click() {
    screenshot="$1.png"
    template="$template_dir/$2.png"
    threshold=0.9
    result=$(python3 -c "
import cv2
import numpy as np
screenshot = cv2.imread('$screenshot')
template = cv2.imread('$template')
result = cv2.matchTemplate(screenshot, template, cv2.TM_CCOEFF_NORMED)
threshold = $threshold
locations = np.where(result >= threshold)
if len(locations[0]) > 0:
    print('found')
else:
    print('not found')
")
    if [[ "$result" == "found" ]]; then
        echo "Found $template, clicking..."
        xdotool mousemove $(xdotool getmouselocation | awk '{print $1}' | cut -d':' -f2) $(xdotool getmouselocation | awk '{print $2}' | cut -d':' -f2)) click 1
        return 0
    else
        echo "$template not found"
        return 1
    fi
}

while true; do
    take_screenshot "Screenshot"
    search_and_click "Screenshot" "PrepareQuest"
    sleep 4

    take_screenshot "Screenshot"
    search_and_click "Screenshot" "StartQuest"
    sleep 4

    echo "Waiting for 3 minutes..."
    sleep 180

    take_screenshot "Screenshot"
    search_and_click "Screenshot" "TapScreen"
    if [$? -eq 0 ]; then
    sleep 5
    take_screenshot "Screenshot"
    search_and_click "Screenshot" "NextQuest"
    if [ $? -eq 0 ]; then
        sleep 4
        echo "Restarting script"
        continue
    fi

    take_screenshot "Screenshot"
    search_and_click "Screenshot" "Failed"
    if [ $? -eq 0 ]; then
        sleep 4
        take_screenshot "Screenshot"
        search_and_click "Screenshot" "QuitButton"
        sleep 4
	take_screenshot "Screenshot"
	search_and_click "Screenshot" "Quit"
	sleep 4
        take_screenshot "Screenshot"
        search_and_click "Screenshot" "Ok"
	sleep 4
        take_screenshot "Screenshot"
        search_and_click "Screenshot" "TapScreen"
	sleep 4
	take_screenshot "Screenshot"
	search_and_click "Screenshot" "Home"
	sleep 4
   fi
   sleep 1
done
