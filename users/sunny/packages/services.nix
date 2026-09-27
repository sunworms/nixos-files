{
  pkgs,
  lib,
  ...
}: let
  batteryNotifyScript = pkgs.writeShellScript "battery-notify.sh" ''
    #!/usr/bin/env bash
    BAT="BAT0"
    POLL_INTERVAL=60
    LOW_THRESHOLD=20
    STATE_FILE="/tmp/battery-notify-state"

    prev_state="normal"
    [ -f "$STATE_FILE" ] && prev_state=$(cat "$STATE_FILE")

    while true; do
        if [ -r "/sys/class/power_supply/$BAT/capacity" ]; then
            CAPACITY=$(cat "/sys/class/power_supply/$BAT/capacity")
            STATUS=$(cat "/sys/class/power_supply/$BAT/status")

            if [ "$STATUS" = "Discharging" ] && [ "$CAPACITY" -le "$LOW_THRESHOLD" ]; then
                if [ "$prev_state" != "low" ]; then
                    ${lib.getExe pkgs.libnotify} -u critical -h string:x-canonical-private-synchronous:bat-notify \
                        "Battery Low" "Level at ''${CAPACITY}%"
                    prev_state="low"
                    echo "$prev_state" > "$STATE_FILE"
                fi
            elif [ "$STATUS" = "Full" ] || { [ "$STATUS" = "Charging" ] && [ "$CAPACITY" -ge 99 ]; }; then
                if [ "$prev_state" != "full" ]; then
                    ${lib.getExe pkgs.libnotify} -u normal -h string:x-canonical-private-synchronous:bat-notify \
                        "Battery Charged" "Battery is fully charged!"
                    prev_state="full"
                    echo "$prev_state" > "$STATE_FILE"
                fi
            else
                if [ "$prev_state" != "normal" ]; then
                    prev_state="normal"
                    echo "$prev_state" > "$STATE_FILE"
                fi
            fi
        fi
        sleep "$POLL_INTERVAL"
    done
  '';
in {
  systemd.services = {
    battery-notify = {
      description = "Battery low/full notification daemon";
      wantedBy = ["graphical-session.target"];
      partOf = ["graphical-session.target"];
      serviceConfig = {
        ExecStart = "${batteryNotifyScript}";
        Restart = "always";
      };
    };
    rclone-gdrive = {
      description = "Mount Google Drive via rclone";
      after = ["network-online.target"];
      wants = ["network-online.target"];
      environment = {
        PATH = lib.mkForce null;
      };
      serviceConfig = {
        Type = "notify";

        ExecStartPre = ''
          /usr/bin/env mkdir -p %h/Documents/gdrive
        '';

        ExecStart = ''
          /usr/bin/env rclone mount gdrive: %h/Documents/gdrive --vfs-cache-mode writes
        '';

        ExecStop = ''
          /usr/bin/env fusermount3 -u %h/Documents/gdrive
        '';

        Restart = "on-failure";
        RestartSec = 5;
      };

      wantedBy = ["default.target"];
    };

    helium-del-cache = {
      description = "Delete Helium Cache on login";
      after = ["default.target"];
      wantedBy = ["default.target"];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = ''
          /usr/bin/env rm -rf "%h/.config/net.imput.helium/Default/AutofillAiModelCache" "%h/.config/net.imput.helium/Default/DawnGraphiteCache" "%h/.config/net.imput.helium/Default/DawnWebGPUCache" "%h/.config/net.imput.helium/Default/GPUCache" "%h/.config/net.imput.helium/Default/optimization_guide_hint_cache_store" "%h/.config/net.imput.helium/Default/Service Worker"
        '';
      };
    };
  };
}
