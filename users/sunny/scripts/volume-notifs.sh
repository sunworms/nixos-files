#!/usr/bin/env bash

sink=$(wpctl inspect @DEFAULT_AUDIO_SINK@ | grep -oP 'node.name = "\K[^"]+')

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

if echo "$volume" | grep -q "MUTED"; then
    notify-send -a "Volume" -h int:value:0 -h string:x-canonical-private-synchronous:volume "Volume Muted"
else
    percent=$(echo "$volume" | awk '{printf "%.0f", $2 * 100}')
    notify-send -a "Volume" -h int:value:$percent -h string:x-canonical-private-synchronous:volume "Volume: ${percent}%"
fi
