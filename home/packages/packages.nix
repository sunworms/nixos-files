{ config, lib, pkgs, ... }:

{
  imports = [
    ./fonts.nix
    ./blueman.nix
    ./discord.nix
    ./spotify.nix
    ./browser.nix
  ];
  home.packages = with pkgs; [
    swaybg
    swww
    swayidle
    swaylock
    pavucontrol
    playerctl
    imagemagick
    nemo
    file-roller
    nemo-fileroller
    xdg-user-dirs
    jamesdsp
    kdePackages.kate
    kdePackages.okular
  ];
}
