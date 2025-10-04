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
        ".config/discord"
        ".config/spotify"
      ];
      files = [];
    };
  };
}
