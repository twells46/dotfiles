#!/bin/sh

if [ "${XDG_SESSION_TYPE}" = "wayland" ]; then
	wl-paste
else
	xsel -ob
fi
