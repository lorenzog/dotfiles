#!/bin/bash
die() {
	echo "$1"
	exit 1
}
command -v dateutils.ddiff >/dev/null 2>&1 || die "Install ddiff from dateutils" 
# stalled jobs (waiting for 'ok' are = in the queue)
# NEXT_JOB=$(atq | grep -v '=' | cut -f 2 )
NEXT_JOB=$(atq | cut -f 2 )
test -z "$NEXT_JOB" && die "XXX"
echo "$NEXT_JOB" | grep '=' > /dev/null && OVERDUE=1
NOW=$(date +"%a %b %d %H:%M:%S")
TIME_LEFT=$(dateutils.ddiff -i "%a %b %d %H:%M:%S" -f "%M" "$NOW" "$NEXT_JOB")
test -z "$OVERDUE" && echo "$TIME_LEFT" || echo "Overdue: $TIME_LEFT"
