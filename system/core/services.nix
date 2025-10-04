{ config, lib, pkgs, ... }:

{
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
      RestartSec = "2s";
    };
  };
}
