{ config, lib, pkgs, ... }:

{
  imports = [
    ./fonts.nix
    ./blueman.nix
    # ./nixcord.nix
    ./discord.nix
    ./spotify.nix
    ./gaming.nix
  ];
  home.packages = with pkgs; [
    firefox
    waybar
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
