{ config, lib, pkgs, ... }:

{
  imports = [
    ./packages/packages.nix
    ./niri-and-essentials/niri.nix
    ./fuzzel/app-launcher.nix
    ./git.nix
    ./shell.nix
    ./desktop-files.nix
    ./theming/gtk.nix
  ];

  home.username = "sunny";
  home.homeDirectory = "/home/sunny";

  home.stateVersion = "25.11";
}
