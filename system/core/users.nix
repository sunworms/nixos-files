{ config, lib, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./network.nix
    ./timelocale.nix
  ];

  users.users.sunny = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
