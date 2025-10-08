{ config, lib, pkgs, ... }:

{
  imports = [
    ./discord.nix
    ./blueman.nix
    ./hyfetch.nix
    ./helix.nix
  ];

  home.packages = with pkgs; [
    firefox
    youtube-music
    mate.atril

    wineWow64Packages.stable
    winetricks
    (callPackage ../derivations/pcsx2.nix { })
    ppsspp-sdl-wayland
    melonDS
    azahar
    mgba
    sameboy

    unrar
    p7zip

    nemo-with-extensions
    xdg-user-dirs

    (writeShellScriptBin "niri-color-picker" ''
    niri msg pick-color | awk '$1 == "Hex:" { printf "%s", $2 }' | wl-copy
    '')
  ];
}
