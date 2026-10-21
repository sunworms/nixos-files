#!/usr/bin/env bash

SOURCE='@DEFAULT_AUDIO_SOURCE@'

case "${1-}" in
    mute|toggle)
        wpctl set-mute "$SOURCE" toggle
        ;;
    unmute)
        wpctl set-mute "$SOURCE" 0
        ;;
    status|'')
        ;;
    *)
        printf 'Usage: %s [mute|toggle|unmute|status]\n' "$0" >&2
        exit 2
        ;;
esac

STATUS=$(wpctl get-volume "$SOURCE")

if grep -q MUTED <<< "$STATUS"; then
    notify-send \
        -t 1500 \
        -a osd \
        -u low \
        -h string:x-canonical-private-synchronous:microphone \
        -h int:value:0 \
        '󰍭  Microphone muted'
    exit 0
fi

VOL=$(awk '{printf "%.0f", $2 * 100}' <<< "$STATUS")

notify-send \
    -t 1500 \
    -a osd \
    -u low \
    -h string:x-canonical-private-synchronous:microphone \
    -h int:value:"$VOL" \
    '󰍬  Microphone active' "${VOL}%"
