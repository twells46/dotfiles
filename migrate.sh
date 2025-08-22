#!/bin/sh

mkdir -p "${1}/.config"
cp -r "/home/tom/.config/${1}" "${1}/.config/"
