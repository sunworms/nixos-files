{ config, lib, pkgs, ... }:

{
  users.users.sunny = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  systemd.tmpfiles.rules = [
    "d /home/sunny      0755  sunny users -"
  ];
}
