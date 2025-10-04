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
      { directory = "/home/sunny"; user = "sunny"; group = "users"; mode = "0755"; }
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
