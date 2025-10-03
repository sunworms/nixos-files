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
      "/etc/passwd"
      "/etc/shadow"
      "/etc/group"
      "/etc/gshadow"
    ];
    users.sunny = {
      directories = [
        "nixos-files"
        "Documents"
        "Games"
        "Music"
        "Pictures"
        "Videos"
        "VMs"
        ".mozilla"
      ];
      files = [
        ".p10k.zsh"
        ".zsh_history"
        ".config/katerc"
        ".config/discord/Cookies"
        ".config/jamesdsp/audio.conf"
        ".config/jamesdsp/application.conf"
        ".config/spotify/prefs"
      ];
    };
  };
}
