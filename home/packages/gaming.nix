{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    wineWow64Packages.stable
    winetricks
    pcsx2
    ppsspp-sdl-wayland
    melonDS
    azahar
    mgba
    sameboy
    # archive tools
    unrar
    p7zip-rar
  ];
}
