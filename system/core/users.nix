{ config, lib, pkgs, ... }:

{
  users.users.sunny = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  fileSystems."/home/sunny" = {
    device = "/persist/home/sunny";
    fsType = "none";
    options = [ "bind" ];
  };
}
