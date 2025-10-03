{ config, lib, pkgs, ... }:

{
  home.persistence."/persist/home/sunny" = {
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
    allowOther = true;
  };
}
