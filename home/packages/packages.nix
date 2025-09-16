{ config, lib, pkgs, ... }:

{
  imports = [
    ./fonts.nix
    ./blueman.nix
    ./discord.nix
    ./spotify.nix
    ./gaming/emulators.nix
  ];
  home.packages = with pkgs; [
    ghostty
    firefox
    p7zip
    waybar
    swaybg
    swww
    swayidle
    swaylock
    pavucontrol
    playerctl
    imagemagick
    nemo
    jamesdsp
    xwayland-satellite
    kdePackages.kate
    kdePackages.okular
  ];
}
