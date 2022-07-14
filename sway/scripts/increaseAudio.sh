#!/bin/sh
current=$(pactl get-sink-volume @DEFAULT_SINK@ | awk 'NR==1{print $5}' | sed 's/\%//')
[ $current -lt 100 ] && pactl set-sink-volume @DEFAULT_SINK@ +5%
[ $current -gt 100 ] && pactl set-sink-volume @DEFAULT_SINK@ 100%