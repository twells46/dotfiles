#!/bin/sh
# Start Firefox with a temporary profile

set -eu

PROFILEDIR=$(mktemp --tmpdir -d tmp-ff-profile.XXXXXX.d)
trap "rm -rf ${PROFILEDIR}" INT EXIT QUIT TERM ABRT

firefox -profile "$PROFILEDIR" -no-remote -new-instance
