{ pkgs, ... }:

{
  services.mako = {
    enable = true;
    settings = {
      border-size = 1;
      default-timeout = 10000;
    };
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

  home.packages = with pkgs; [
    swayidle
  ];

  systemd.user.services.swayidle = {
    Unit = {
      Description = "swayidle (conditional per compositor)";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };

    Service =
      let
        swayidle-launch = pkgs.writeShellScript "swayidle-launch" ''
          compositor="''${XDG_CURRENT_DESKTOP:-unknown}"
          echo "Detected compositor: ''${compositor}"

          case "''${compositor}" in
            niri)
              echo "Launching swayidle with Niri timeouts"
              exec ${pkgs.swayidle}/bin/swayidle -w \
                timeout 300 '${pkgs.swaylock}/bin/swaylock -fF' \
                timeout 600 'niri msg action power-off-monitors' \
                resume 'niri msg action power-on-monitors'
              ;;

            mango)
              echo "Launching swayidle with MangoWC settings"
              exec ${pkgs.swayidle}/bin/swayidle -w \
                timeout 300 '${pkgs.swaylock}/bin/swaylock -fF' \
                timeout 600 '${pkgs.wlopm}/bin/wlopm --off *' \
                resume '${pkgs.wlopm}/bin/wlopm --on *'
              ;;

            *)
              echo "Unknown compositor; running default swayidle"
              exec ${pkgs.swayidle}/bin/swayidle -w \
                timeout 600 'echo "Idle timeout reached"' \
                resume 'echo "System resumed"'
              ;;
          esac
        '';
      in
      {
        ExecStart = "${swayidle-launch}";

        Restart = "on-failure";
        RestartSec = 2;
      };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
