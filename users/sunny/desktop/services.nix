{
  pkgs,
  lib,
  ...
}:

{
  systemd.services = {
    polkit-soteria = {
      description = "Soteria, Polkit authentication agent for any desktop environment";

      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];

      serviceConfig = {
        ExecStart = lib.getExe pkgs.soteria;
        Type = "simple";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}
