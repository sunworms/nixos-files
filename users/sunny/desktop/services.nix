{
  pkgs,
  lib,
  sources,
  ...
}:

let
  sunnyEmacs = (pkgs.callPackage ./emacs/emacs.nix { inherit sources; }).default;
in
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

    emacs-daemon = {
      description = "Emacs daemon";
      wantedBy = [ "default.target" ];
      environment = {
        PATH = lib.mkForce "/run/wrappers/bin:/etc/profiles/per-user/sunny/bin:/run/current-system/sw/bin";
      };
      serviceConfig = {
        Type = "forking";
        ExecStartPre = "${pkgs.coreutils}/bin/sleep 2";
        ExecStart = "${sunnyEmacs}/bin/emacs --daemon";
        ExecStop = "${sunnyEmacs}/bin/emacsclient -e '(kill-emacs)'";
        Restart = "on-failure";
        WorkingDirectory = "%h";
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
