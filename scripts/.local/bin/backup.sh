#!/bin/dash

DIR="${XDG_DATA_HOME:-$HOME/.local/share}/backup$(date -I)"

echo "sudo required for complete backup"
sudo rsync -qa "${XDG_CONFIG_HOME:-$HOME/.config}" /etc /usr "$DIR"
sudo tar -c -I"zstd -10 -T0" -f "$DIR.tar.zst" -C "$DIR" .. \
	|| notify-send "Backup failed" "Please run backup.sh manually to inspect output"

sudo chmod +x "$DIR.tar.zst"

sudo rm -rf "$DIR"

notify-send "Backup finished" "Please place the backup archive somewhere useful"
