if pkill -x wl-mirror; then
    notify-send "wl-mirror" "Presentation stopped."
    exit 0
fi

OUTPUTS=$(niri msg -j outputs | jq -r 'keys[]')

if [ -z "$OUTPUTS" ]; then
    notify-send "wl-mirror" "No outputs detected."
    exit 1
fi

SOURCE=$(echo "$OUTPUTS" | fuzzel --dmenu --prompt="Mirror Source: ")
[ -z "$SOURCE" ] && exit 0

DESTINATION=$(echo "$OUTPUTS" | grep -v "^${SOURCE}$" | fuzzel --dmenu --prompt="Mirror Destination: ")
[ -z "$DESTINATION" ] && exit 0

niri msg action focus-output "$DESTINATION"
wl-mirror -S "$SOURCE" &
niri msg action focus-output "$SOURCE"

notify-send "wl-mirror" "Mirroring $SOURCE onto $DESTINATION"
