#!/usr/bin/env bash

for _ in {0..51}; do
    echo "Do ((1 + $RANDOM % 10))"
    echo "Of ((1 + $RANDOM % 4))"
    read -r -p "Press Enter to continue" </dev/tty
done
