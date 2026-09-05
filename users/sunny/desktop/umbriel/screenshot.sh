set -euo pipefail

MODE="${1:-}"
FREEZE=false
[[ "${2:-}" == "--freeze" ]] && FREEZE=true

SAVE_DIR="${XDG_PICTURES_DIR:-$HOME/Pictures}/Screenshots"
mkdir -p "$SAVE_DIR"
FILEPATH="$SAVE_DIR/screenshot-$(date +%Y%m%d-%H%M%S).png"

FREEZE_PID=""

notify() {
    command -v notify-send >/dev/null 2>&1 && notify-send "Screenshot" "$1" || true
}

cleanup() {
    if [[ -n "$FREEZE_PID" ]]; then
        kill "$FREEZE_PID" 2>/dev/null || true
        wait "$FREEZE_PID" 2>/dev/null || true
    fi
}
trap cleanup EXIT

start_freeze() {
    if ! command -v wayfreeze >/dev/null 2>&1; then
        notify "wayfreeze not found — install it for --freeze support (continuing without it)"
        return
    fi
    wayfreeze >/dev/null 2>&1 &
    FREEZE_PID=$!
    sleep 0.1
}

case "$MODE" in
    full)
        grim "$FILEPATH"
        ;;

    region)
        $FREEZE && start_freeze
        geom=$(slurp) || { notify "Cancelled"; exit 1; }
        grim -g "$geom" "$FILEPATH"
        ;;

    window)
        geom=$(umbriel windows --json | jq -r '.[] | select(.focused == true) | "\(.x),\(.y) \(.w)x\(.h)"')
        if [[ -z "$geom" ]]; then
            notify "No focused window found"
            exit 1
        fi
        grim -g "$geom" "$FILEPATH"
        ;;

    *)
        echo "Usage: $0 [full|region|window] [--freeze]" >&2
        exit 1
        ;;
esac

cleanup
trap - EXIT

wl-copy < "$FILEPATH"
notify "Saved to $FILEPATH and copied to clipboard"
echo "$FILEPATH"
