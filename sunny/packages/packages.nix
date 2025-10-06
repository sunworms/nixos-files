{ config, lib, pkgs, ... }:

{
  imports = [
    ./discord.nix
    ./blueman.nix
  ];

  home.packages = with pkgs; [
    firefox
    youtube-music

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

    kdePackages.kate
    kdePackages.okular

    (writeShellScriptBin "niri-color-picker" ''
    niri msg pick-color | awk '$1 == "Hex:" { printf "%s", $2 }' | wl-copy
    '')
  ];
}
