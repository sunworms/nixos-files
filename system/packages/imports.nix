{ config, lib, pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./desktop.nix
    ./swaylock.nix
    ./fonts.nix
    ./portals.nix
    ./programs.nix
  ];
}
