#!/usr/bin/env bash

options="Lock\nLogout\nSuspend\nReboot\nShutdown\nCancel"

selection=$(echo -e "$options" | fuzzel --dmenu --prompt="Choose an action:")

case $selection in
    "Lock")
        gtklock
        ;;
    "Logout")
        mmsg -d quit
        ;;
    "Suspend")
        systemctl suspend
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Shutdown")
        systemctl poweroff
        ;;
    "Cancel")
        exit 0
        ;;
    *)
        exit 1
        ;;
esac
