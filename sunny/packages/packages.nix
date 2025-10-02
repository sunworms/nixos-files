{ config, lib, pkgs, ... }:

{
  imports = [
    ./spotify.nix
    ./discord.nix
  ];

  home.packages = with pkgs; [
    firefox

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
