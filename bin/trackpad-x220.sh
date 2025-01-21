#!/bin/sh
# tap twice to drag + hold
synclient TapButton1=1
# self-explanatory
synclient CircularScrolling=1
synclient RightEdge=5000
synclient BottomEdge=4500
synclient LeftEdge=200
synclient VertTwoFingerScroll=1
synclient HorizTwoFingerScroll=1
synclient VertScrollDelta=-80
synclient HorizScrollDelta=40
# disable trackpoint
xinput set-prop 10 188 0
# xinput list
# xinput list-props <id>
# locked drags for trackpad
# xinput set-prop 9 334 1
# two finger, right click
synclient TapButton2=3

