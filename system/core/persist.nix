{ config, lib, pkgs, ... }:

{
  environment.persistence."/persist" = {
    enable = true;
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
    ];
    files = [
      "/etc/machine-id"
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
      ];
    };
  };
}
