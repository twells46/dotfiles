#!/bin/sh
# Start Firefox with a temporary profile

set -eu

PROFILEDIR=$(mktemp -d "${XDG_RUNTIME_DIR:-$HOME/.cache}"/tmp-ff-profile.XXXXXX.d)
trap "rm -rf ${PROFILEDIR}" INT EXIT QUIT TERM ABRT

if command firefox --version; then
	firefox -profile "$PROFILEDIR" -no-remote -new-instance
else
        flatpak run --filesystem="$PROFILEDIR":rw org.mozilla.firefox \
                -profile "$PROFILEDIR" -no-remote -new-instance
fi
