{ config, lib, pkgs, ... }:

{
  imports = [
    ./wine.nix
  ];

  home.packages = with pkgs; [
    pcsx2
    ppsspp-sdl-wayland
    azahar
    melonDS
  ];
}
