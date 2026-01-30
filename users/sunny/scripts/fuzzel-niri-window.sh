#!/usr/bin/env bash

# Get list of windows from niri
windows=$(niri msg --json windows)

# Parse window list and create fuzzel-friendly format
# Format: "window_id: app_id - title"
selection=$(echo "$windows" | jq -r '.[] | "\(.id): \(.app_id) - \(.title)"' | fuzzel --dmenu)

# Exit if nothing selected
if [ -z "$selection" ]; then
    exit 0
fi

# Extract window ID from selection
window_id=$(echo "$selection" | cut -d':' -f1)

# Focus the selected window
niri msg action focus-window --id "$window_id"
