{ config, lib, pkgs, ... }:

{
  imports = [
    ./nix-settings.nix
    ./boot.nix
    ./zram-and-fs.nix
    ./network.nix
    ./timelocale.nix
    ./security.nix
  ];

  users.users.sunny = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
