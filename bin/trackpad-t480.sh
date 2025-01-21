#!/bin/sh
# tap twice to drag + hold
synclient TapButton1=1
# self-explanatory
# synclient CircularScrolling=1
# synclient RightEdge=5000
# synclient BottomEdge=4500
# synclient LeftEdge=200
synclient VertTwoFingerScroll=1
synclient HorizTwoFingerScroll=1
synclient VertScrollDelta=-80
synclient HorizScrollDelta=40
# disable trackpoint
# xinput set-prop 10 186 0
# xinput set-prop 10 "Device Enabled" 0
xinput set-prop "TPPS/2 IBM TrackPoint" "Device Enabled" 1
# xinput list
# xinput list-props <id>
# locked drags for trackpad
# xinput set-prop 9 334 1
# two finger, right click
synclient TapButton2=3
# trying
synclient FingerLow=15
