{ config, lib, pkgs, ... }:

{
  imports = [
    ./overlays.nix
    ./audio.nix
    ./bluetooth.nix
    ./desktop.nix
    ./swaylock.nix
    ./fonts.nix
    ./portals.nix
    ./programs.nix
  ];
}
