{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    (writeShellScriptBin "logout-menu" ''
    # Define menu options
    options=" Lock\n󰍃 Logout\n⏾ Suspend\n Hibernate\n Reboot\n Shutdown"

    # Show menu with fuzzel
    choice=$(echo -e "$options" | fuzzel --dmenu --prompt="System: " --lines=6)

    case "$choice" in
        " Lock") swaylock ;; # or your locker, e.g. swaylock, hyprlock
        "󰍃 Logout") niri msg action quit --skip-confirmation ;; # or hyprctl dispatch exit
        "⏾ Suspend") systemctl suspend ;;
        " Hibernate") systemctl hibernate ;;
        " Reboot") systemctl reboot ;;
        " Shutdown") systemctl poweroff ;;
        *) exit 0 ;;
    esac
    '')
  ];
}
