{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    wineWow64Packages.wayland
    winetricks
  ];
}
