#!/bin/zsh
# Rmove annoying characters from filenames
# You may need to run multiple times to get everything depending on directory names

for f in **/*\ *; do mv "${f}" "${f// /_}"; done
for f in **/*\'*; do mv "$f" "${f//'/}"; done
for f in **/*＂*; do mv "$f" "${f//＂/}"; done
