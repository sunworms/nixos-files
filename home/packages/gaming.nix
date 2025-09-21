{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # for running games
    wineWow64Packages.staging
    winetricks
    pcsx2
    ppsspp-sdl-wayland
    melonDS
    mgba
    azahar
    # for unpacking games
    p7zip
    unzip
    unrar
  ];
}
