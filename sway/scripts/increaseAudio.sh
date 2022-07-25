#!/bin/sh
current=$(pactl get-sink-volume @DEFAULT_SINK@ | awk 'NR==1{print $5}' | sed 's/\%//')
if [ $current -gt 95 ]
then
    pactl set-sink-volume @DEFAULT_SINK@ 100%
else
    pactl set-sink-volume @DEFAULT_SINK@ +5%
fi