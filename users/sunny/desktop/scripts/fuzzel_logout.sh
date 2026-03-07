#!/bin/bash

# Fuzzel Logout Menu Script
# A simple power menu using fuzzel

# Define menu options
options="Lock\nLogout\nSuspend\nReboot\nShutdown"

# Show menu and get selection
selected=$(echo -e "$options" | fuzzel --dmenu --prompt="Power: ")

# Execute action based on selection
case "$selected" in
    Lock)
        # Lock the screen (adjust command based on your lock screen)
        gtklock
        ;;
    Logout)
        # Logout (adjust based on your window manager/desktop environment)
        # For Sway:
        niri msg action quit --skip-confirmation
        # For Hyprland:
        # hyprctl dispatch exit
        # For other compositors, use: loginctl terminate-user $USER
        ;;
    Suspend)
        systemctl suspend
        ;;
    Reboot)
        systemctl reboot
        ;;
    Shutdown)
        systemctl poweroff
        ;;
    *)
        # User cancelled or invalid selection
        exit 0
        ;;
esac
