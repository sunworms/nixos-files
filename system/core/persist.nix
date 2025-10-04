{ config, lib, pkgs, ... }:

{
  environment.persistence."/persist" = {
    enable = true;
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd"
    ];
    files = [
      "/etc/machine-id"
    ];

    users.sunny = {
      directories = [
        "Documents"
        "Games"
        "Music"
        "Pictures"
        "Videos"
        "VMs"

        ".mozilla"
        ".wine"

        ".config/discord"
        ".config/spotify"
        ".config/azahar-emu"
        ".config/PCSX2"
        ".config/melonDS"
        ".config/mgba"
        ".config/ppsspp"
        ".config/eden"

        ".local/share/eden"
        ".local/share/azahar-emu"
      ];
      files = [];
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
}
