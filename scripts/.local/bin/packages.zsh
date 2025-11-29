#!/bin/zsh

sort <(pacman -Qqeng plasma) <(pacman -Qqen) | uniq -u
