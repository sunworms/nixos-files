#!/usr/bin/env bash

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

if echo "$volume" | grep -q "MUTED"; then
    # Added -h string:x-dunst-stack-tag:volume for better compatibility
    notify-send -a "System" -u low -h int:value:0 -h string:x-canonical-private-synchronous:volume "Volume Muted"
else
    percent=$(echo "$volume" | awk '{printf "%.0f", $2 * 100}')
    # The 'synchronous' hint is key here to replace the previous bar
    notify-send -a "System" -u low -h int:value:$percent -h string:x-canonical-private-synchronous:volume "Volume: ${percent}%"
fi
