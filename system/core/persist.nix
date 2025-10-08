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
        ".config/YouTube Music"
        ".config/azahar-emu"
        ".config/PCSX2"
        ".config/melonDS"
        ".config/mgba"
        ".config/ppsspp"
        ".config/eden"

        ".local/share/eden"
        ".local/share/azahar-emu"
        ".local/share/fish"
      ];
      files = [];
    };
  };
}
