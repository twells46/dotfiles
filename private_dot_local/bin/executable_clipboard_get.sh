#!/bin/sh

if [ -n "${WAYLAND_DISPLAY}" ]; then
	cat | wl-copy
elif [ -n "${DISPLAY}" ]; then
	cat | xsel -ib
else
	echo "Error: No Wayland or X11 display detected" >&2
	exit 1
fi

