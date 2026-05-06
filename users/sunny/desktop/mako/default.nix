{ pkgs, ... }:

{
  packages = with pkgs; [
    mako
    libnotify
    (writeShellScriptBin "volume-notif" ''
      volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

      if echo "$volume" | grep -q "MUTED"; then
          notify-send -a "System" -u low -h int:value:0 -h string:x-canonical-private-synchronous:volume "Volume Muted"
      else
          percent=$(echo "$volume" | awk '{printf "%.0f", $2 * 100}')
          notify-send -a "System" -u low -h int:value:$percent -h string:x-canonical-private-synchronous:volume "Volume: ''${percent}%"
      fi
    '')
    (writeShellScriptBin "bright-notif" ''
      brightness=$(brightnessctl get)
      max=$(brightnessctl max)
      percent=$((brightness * 100 / max))

      notify-send -a "System" -u low -h int:value:$percent -h string:x-canonical-private-synchronous:brightness "Brightness: ''${percent}%"
    '')
  ];

  xdg.config.files = {
    "mako/config".source = ./config;
  };
}
