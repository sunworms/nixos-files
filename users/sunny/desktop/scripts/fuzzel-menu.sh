#!/usr/bin/env bash

launcher() {
    fuzzel --dmenu --prompt "$1"
}

main_menu() {
    ws=$(niri msg -j workspaces | jq -r '.[] | select(.is_active).idx')
    win=$(niri msg -j focused-window | jq -r '.title')

    cpu=$(get_cpu)
    mem=$(awk '/MemAvailable/ {avail=$2} /MemTotal/ {total=$2} END {printf "%.0f%%", (1-avail/total)*100}' /proc/meminfo)

    net=$(get_net)

    local current_time
    current_time=$(date "+%A, %d %B  %H:%M")
    
    choice=$(printf \
"${current_time}
App Launcher
Workspaces (Current: %s)
Window: %s
Power Menu
Clipboard History
CPU: %s | MEM: %s
Net: %s
" "$ws" "$win" "$cpu" "$mem" "$net" | launcher "Main")

    case "$choice" in
        *App*) app_launcher ;;
        *Workspaces*) workspace_menu ;;
        *Window*) window_menu ;;
        *Power*) power_menu ;;
        *Clipboard*) clipboard_menu ;;
        *CPU*) footclient btop ;;
        *Net*) footclient nmtui ;;
    esac
}

app_launcher() {
    fuzzel --no-icons
}

workspace_menu() {
    ws=$(niri msg -j workspaces | jq -r '.[].idx')
    choice=$(printf "%s\n" $ws | launcher "Switch Workspace")
    [ -n "$choice" ] && niri msg action focus-workspace "$choice"
}

window_menu() {
    windows=$(niri msg --json windows)
    selection=$(echo "$windows" | jq -r '.[] | "\(.id): \(.app_id) - \(.title)"' | fuzzel --dmenu)
    window_id=$(echo "$selection" | cut -d':' -f1)
    niri msg action focus-window --id "$window_id"
}

power_menu() {
    choice=$(printf "Lock\nSuspend\nShutdown\nReboot\nLogout\n" | launcher "Power")

    case "$choice" in
	Lock) gtklock ;;
	Suspend) systemctl suspend ;;
        Shutdown) systemctl poweroff ;;
        Reboot) systemctl reboot ;;
        Logout) niri msg action quit --skip-confirmation;;
    esac
}

clipboard_menu() {
    cliphist-fuzzel-img
}

get_net() {
    local iface
    iface=$(ip route get 8.8.8.8 2>/dev/null | awk '{for(i=1;i<=NF;i++) if($i=="dev") {print $(i+1); exit}}')
    [[ -z "$iface" ]] && { echo "↑0 B/s ↓0 B/s"; return; }

    local cache_dir="${XDG_RUNTIME_DIR:-/tmp}/menu_net_cache"
    mkdir -p "$cache_dir"
    local rx_file="$cache_dir/rx" tx_file="$cache_dir/tx" ts_file="$cache_dir/ts"

    local rx2 tx2 now
    rx2=$(< /sys/class/net/"$iface"/statistics/rx_bytes)
    tx2=$(< /sys/class/net/"$iface"/statistics/tx_bytes)
    now=$(date +%s%N)  # nanoseconds for precision

    if [[ -f "$rx_file" && -f "$ts_file" ]]; then
        local rx1 tx1 ts1 elapsed_ns rx_rate tx_rate
        rx1=$(< "$rx_file"); tx1=$(< "$tx_file"); ts1=$(< "$ts_file")
        elapsed_ns=$(( now - ts1 ))
        # rates in bytes/sec
        rx_rate=$(( (rx2 - rx1) * 1000000000 / elapsed_ns ))
        tx_rate=$(( (tx2 - tx1) * 1000000000 / elapsed_ns ))
    else
        rx_rate=0; tx_rate=0
    fi

    # Save state for next invocation
    echo "$rx2" > "$rx_file"
    echo "$tx2" > "$tx_file"
    echo "$now" > "$ts_file"

    human() {
        local b=$1
        if   (( b >= 1048576 )); then printf "%.1f MB/s" "$(echo "scale=1; $b/1048576" | bc)"
        elif (( b >= 1024 ));    then printf "%.1f KB/s" "$(echo "scale=1; $b/1024" | bc)"
        else echo "${b} B/s"
        fi
    }

    echo "↑$(human $tx_rate) ↓$(human $rx_rate)"
}

get_cpu() {
    read -r cpu user nice system idle iowait irq softirq steal _ < /proc/stat
    total1=$((user + nice + system + idle + iowait + irq + softirq + steal))
    idle1=$((idle + iowait))

    sleep 0.1

    read -r cpu user nice system idle iowait irq softirq steal _ < /proc/stat
    total2=$((user + nice + system + idle + iowait + irq + softirq + steal))
    idle2=$((idle + iowait))

    total=$((total2 - total1))
    idle=$((idle2 - idle1))

    usage=$(( (100 * (total - idle)) / total ))

    echo "${usage}%"
}

main_menu
