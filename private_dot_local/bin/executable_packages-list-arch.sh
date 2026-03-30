#!/usr/bin/env dash

{ pacman -Qqeng plasma; pacman -Qqen; } | sort | uniq -u
