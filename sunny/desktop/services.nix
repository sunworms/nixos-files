{ pkgs, ... }:

{
  services.mako = {
    enable = true;
    settings = {
      border-size = 1;
      default-timeout = 10000;
    };
  };

  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.swaylock}/bin/swaylock -fF";
      }
      {
        timeout = 600;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock -fF";
      }
    ];
    systemdTarget = "graphical-session.target";
  };

  services.cliphist = {
    enable = true;
    allowImages = true;
    systemdTargets = [ "graphical-session.target" ];
  };

  services.swww.enable = true;

  programs.swaylock = {
    enable = true;
    settings = {
      daemonize = true;
      ignore-empty-password = true;
      font-size = 14;
    };
  };

  /*
    systemd.user.services.waybar-toggle = {
    Unit = {
      Description = "Toggle waybar visibility with niri overview";
      After = [
        "waybar.service"
        "graphical-session.target"
      ];
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = pkgs.writeShellScript "niri-waybar-toggle" ''
        trap "" USR1

        niri msg --json event-stream | while read -r event; do
            if echo "$event" | jq -e '.OverviewOpenedOrClosed' > /dev/null 2>&1; then
                is_open=$(echo "$event" | jq -r '.OverviewOpenedOrClosed.is_open')

                if [ "$is_open" = "true" ]; then
                    pkill -USR1 waybar
                else
                    pkill -USR1 waybar
                fi
            fi
        done
      '';
      Restart = "on-failure";
      RestartSec = 3;
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    };
  */
}
