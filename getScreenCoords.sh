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


























































                                            [ Read 13 lines (Converted from DOS format) ]
^G Help         ^O Write Out    ^W Where Is     ^K Cut          ^T Execute      ^C Location     M-U Undo        M-A Set Mark
^X Exit         ^R Read File    ^\ Replace      ^U Paste        ^J Justify      ^/ Go To Line   M-E Redo        M-6 Copy
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
	
