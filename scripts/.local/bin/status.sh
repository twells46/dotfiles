#!/bin/sh

#VOL="$(wpctl get-volume @DEFAULT_SINK@ | awk '{print $2}')"
VOL="$(wpctl get-volume @DEFAULT_SINK@)"
VOL="${VOL#* }"
#VOL="${VOL% *}"

DATE=$(date +"%a %b %d %I:%M %p")

MEM="$(free -m | awk '/^Mem/{print $3}') MiB"

#CPU_LOAD="CPU: $(awk '{print $1}' /proc/loadavg)"
read -r CPU_LOAD < /proc/loadavg
CPU_LOAD="${CPU_LOAD%% *}"

#read -r CPU_TEMP < /sys/class/thermal/thermal_zone0/temp
#CPU_TEMP="$(($CPU_TEMP/1000))"

#BAT="$(cat /sys/class/power_supply/BAT1/capacity)%"
read -r BAT < /sys/class/power_supply/BAT0/capacity

echo "$VOL | $CPU_LOAD | $MEM | $BAT% | $DATE"
