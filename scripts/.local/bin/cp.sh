#!/bin/sh

if [ "${XDG_SESSION_TYPE}" = "wayland" ]; then
	cat | wl-copy
else
	cat | xsel -ib
fi
