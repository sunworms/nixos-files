{ config, lib, pkgs, ... }:

{
  systemd.tmpfiles.rules = [
    "d /home/sunny 0755 sunny users -"
    "d /home/sunny/.config 0755 sunny users -"
    "d /home/sunny/.icons 0755 sunny users -"
    "d /home/sunny/.themes 0755 sunny users -"
    "d /home/sunny/.local 0755 sunny users -"
    "d /home/sunny/.local/share 0755 sunny users -"
    "d /home/sunny/.local/state 0755 sunny users -"
  ];

  /*systemd.services.fix-icon-perms = {
    description = "Fix recursive permissions for ~";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''
        /run/current-system/sw/bin/chown -R sunny:users /home/sunny/.icons
        /run/current-system/sw/bin/chmod -R 0755 /home/sunny/.icons
      '';
    };
  };

  systemd.services.fix-sunny-perms = {
    description = "Fix recursive permissions for ~";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''
        /run/current-system/sw/bin/chown -R sunny:users /home/sunny
        /run/current-system/sw/bin/chmod -R 0755 /home/sunny
      '';
    };
  };

  systemd.services.fix-config-perms = {
    description = "Fix recursive permissions for ~/.config";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''
        /run/current-system/sw/bin/chown -R sunny:users /home/sunny/.config
        /run/current-system/sw/bin/chmod -R 0755 /home/sunny/.config
      '';
    };
  };

  systemd.services.fix-local-perms = {
    description = "Fix recursive permissions for ~/.local";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''
        /run/current-system/sw/bin/chown -R sunny:users /home/sunny/.local
        /run/current-system/sw/bin/chmod -R 0755 /home/sunny/.local
      '';
    };
  };

  systemd.services."home-manager-sunny" = {
    serviceConfig = {
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };*/
}
