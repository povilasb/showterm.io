#!/bin/sh

#
# This script starts rails daemon that runs the showterm app.
# Parameters:
#	$1 - working directory. Where showterm rails app is located.
#	$2 - username to run rails with.
#

WORKING_DIRECTORY="$1"
USERNAME="$2"
QUID=`id -u ${USERNAME}`
QGID=`id -g ${USERNAME}`
PID="/var/run/showterm.pid"

exec \
	start-stop-daemon \
	--start \
	--chdir "${WORKING_DIRECTORY}"
	--exec "rails" \
	--chuid "${QUID}":"${QGID}" \
	--background \
	--pidfile "${PID}" \
	--make-pidfile \
	"$@" -- server
