#!/bin/sh

{ pacman -Qqeng plasma; pacman -Qqen; } | sort | uniq -u
