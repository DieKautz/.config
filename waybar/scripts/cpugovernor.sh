#!/bin/bash
GOV=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
echo '{"text": "perf", "alt": "'$GOV'", "class": "'$GOV'", "tooltip": "Governor <b>'$GOV'</b>"}'
