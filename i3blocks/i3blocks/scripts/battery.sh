#!/bin/bash

BAT_PATH="/sys/class/power_supply/BAT1"

if [ ! -d "$BAT_PATH" ]; then
    BAT_PATH=$(ls -d /sys/class/power_supply/BAT* 2>/dev/null | head -n1)
fi

capacity=$(cat "$BAT_PATH/capacity")
status=$(cat "$BAT_PATH/status")

if [ "$status" = "Charging" ]; then
    color="#00FF00"
elif [ "$capacity" -le 15 ]; then
    color="#FF0000"
elif [ "$capacity" -le 30 ]; then
    color="#FFAA00"
else
    color="#FFFFFF"
fi

echo "<span foreground='$color'>Bat $capacity%</span>"
