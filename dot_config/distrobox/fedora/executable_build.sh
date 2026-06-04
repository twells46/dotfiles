#!/bin/sh
set -eu

if [ "$#" -ne 1 ]; then
	printf "1 arg required\n"
	printf "usage: ./build.sh container-tag:ver\n"
	exit 1
fi

podman build --no-cache -t "${1}" .

printf "Updating distrobox.ini...\n"
sed -i "s|^image=.*\$|image=${1}|" ./distrobox.ini
printf "Updated!\n"
