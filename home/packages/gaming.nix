{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # for running games
    pcsx2
    wineWow64Packages.staging
    winetricks
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
