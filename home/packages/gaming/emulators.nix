{ config, lib, pkgs, ... }:

{
  imports = [
    ./wine.nix
    ./archiver.nix
  ];

  home.packages = with pkgs; [
    pcsx2
    ppsspp-sdl-wayland
    azahar
    melonDS
  ];
}
