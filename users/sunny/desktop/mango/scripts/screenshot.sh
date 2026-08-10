set -euo pipefail
mkdir -p "$HOME/Pictures/Screenshots"
filepath="$HOME/Pictures/Screenshots/$(date +%Y%m%d%H%M%S).png"

capture() {
  if [ -n "${1:-}" ]; then
    grim -g "$1" - | tee "$filepath" | wl-copy -t image/png
  else
    grim - | tee "$filepath" | wl-copy -t image/png
  fi
}

case "${1:-fullscreen}" in
  region)
    g=$(slurp -d); [ -z "$g" ] && exit 1
    capture "$g" ;;
  window)
    g=$(mmsg get focusing-client | jq -r '"\(.x),\(.y) \(.width)x\(.height)"')
    [ -z "$g" ] && exit 1
    capture "$g" ;;
  freeze)
    p=$(mktemp -u).fifo; mkfifo "$p"
    wayfreeze --after-freeze-timeout 100 --after-freeze-cmd "echo > $p" & wp=$!
    read -r < "$p"
    capture
    kill "$wp" 2>/dev/null; rm -f "$p" ;;
  freeze-region)
    p=$(mktemp -u).fifo; mkfifo "$p"
    wayfreeze --after-freeze-timeout 100 --after-freeze-cmd "echo > $p" & wp=$!
    read -r < "$p"; g=$(slurp -d)
    if [ -z "$g" ]; then kill "$wp" 2>/dev/null; rm -f "$p"; exit 1; fi
    capture "$g"
    kill "$wp" 2>/dev/null; rm -f "$p" ;;
  annotate)
    capture
    satty --filename "$filepath" --output-filename "$filepath" --actions-on-enter save-to-file --early-exit
    wl-copy -t image/png < "$filepath" ;;
  *)
    capture ;;
esac
