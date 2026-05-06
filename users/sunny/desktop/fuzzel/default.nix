{ pkgs, ... }:

{
  packages = with pkgs; [
    fuzzel
    (writeShellScriptBin "fuzzel-logout-menu" ''
      options="Lock\nLogout\nSuspend\nReboot\nShutdown"

      selected=$(echo -e "$options" | fuzzel --dmenu --prompt="Power: ")
      case "$selected" in
          Lock)
              gtklock -d
              ;;
          Logout)
              niri msg action quit --skip-confirmation
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
              exit 0
              ;;
      esac
    '')
    (writeShellScriptBin "niri-window-switcher" ''
      windows=$(niri msg --json windows)
      selection=$(echo "$windows" | jq -r '.[] | "\(.id): \(.app_id) - \(.title)"' | fuzzel --dmenu)
      if [ -z "$selection" ]; then
          exit 0
      fi
      window_id=$(echo "$selection" | cut -d':' -f1)
      niri msg action focus-window --id "$window_id"
    '')
  ];

  xdg.config.files."fuzzel/fuzzel.ini".source = ./fuzzel.ini;
}
