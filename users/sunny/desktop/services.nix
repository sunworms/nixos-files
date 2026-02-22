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

    foot = {
      description = "Fast, lightweight and minimalistic Wayland terminal emulator.";
      documentation = [
        "man:foot(1)"
      ];
      environment = {
        PATH = lib.mkForce "/run/wrappers/bin:/etc/profiles/per-user/sunny/bin:/run/current-system/sw/bin";
      };
      partOf = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.foot}/bin/foot --server";
        Restart = "on-failure";
        OOMPolicy = "continue";
        WorkingDirectory = "%h";
      };
      wantedBy = [ "graphical-session.target" ];
    };
  };
}
