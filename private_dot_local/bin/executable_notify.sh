#!/usr/bin/env dash

if [ -n "${WAYLAND_DISPLAY}" ]; then
	herbe="wayherb"
elif [ -n "${DISPLAY}" ]; then
	herbe="herbe"
else
	printf "Error: No display server found\n" >&2
	exit 1
fi

tiramisu -o '#source	#summary	#body' |
while read -r line; do
	head="${line%	*}"
	src="${head%	*}"
	sum="${head#*	}"
	bod="${line##*	}"
	$herbe "${src} | ${sum}: ${bod}"
	# "$(printf '%s' "${line}" | awk -F '\t' '{printf "%s | %s: %s", $1, $2, $3}')"
done

