#!/bin/sh
FOCUSTIME=25
BREAKTIME=5
LONGBREAK=10

DISPLAY=:1.0
COUNT=0

usage() {
	echo "usage: $0 [focus|break] [count] [display]"
	exit 1
}

is_long_break() {
	if [ -z "$1" ] ; then
		COUNT=0
		return
	fi
	# every 4 breaks, 25 min break
	if [ $(($1 % 4)) = 0 ] ; then
		BREAKTIME=25
		COUNT=0
	elif [ $(($1 % 2)) = 0 ] ; then
		BREAKTIME=$LONGBREAK
	fi
}

get_display() { 
	# if $DISPLAY is not set
	if [ -z "$DISPLAY" ] ; then
		echo "no display set in script" > /tmp/d
		if [ -n "$1" ] ; then
			echo "arg was: $1" >> /tmp/d
			export DISPLAY="$1"
		else
			# default
			echo "setting default display" >> /tmp/d
			export DISPLAY=:1.0
		fi
	else
		echo "display was set" >> /tmp/d
		export DISPLAY=$DISPLAY
	fi
} 

# test "$#" -ne 3 && usage
get_display $3
is_long_break $2 

case "$1" in
	"focus")
		# not empty
		# test -n "$2" && FOCUSTIME="$2"
		xmessage -buttons Ok:0,Stop:1 -timeout 0 "Focus time: ${FOCUSTIME} min" -nearmouse || exit
		notify-send -i /usr/share/pixmaps/xscreensaver.xpm "Focus starts now" "Break is in ${FOCUSTIME} minutes"
		# schedule a break in 25 minutes
		echo "~/bin/pomodoro.sh break $((COUNT+1)) ${DISPLAY}" | at -M now + "${FOCUSTIME}" min
		;;
	"break")
		# not empty
		# test -n "$2" && BREAKTIME="$2"
		xmessage -buttons Ok:0,Stop:1 -timeout 0 "Break time: ${BREAKTIME} min" -nearmouse || exit
		# schedule a focus in 10 minutes
		echo "~/bin/pomodoro.sh focus $((COUNT+1)) ${DISPLAY}" | at -M now + "${BREAKTIME}" min
		# notify when focus is
		notify-send -i /usr/share/pixmaps/xscreensaver.xpm "Break time" "Focus is in ${BREAKTIME} minutes"
		;;
	*)
		usage
esac

