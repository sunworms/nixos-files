{ config, lib, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./rofi/rofi.nix
    ./niri/niri.nix
    ./packages.nix
    ./theming.nix
    ./desktop-files.nix
    ./shell.nix
  ];
  enable = true;
  user = "sunny";
  directory = "/home/sunny";
}
