{ config, lib, pkgs, ... }:

{
  packages = with pkgs; [
    firefox
    vesktop

    niri-unstable
    xwayland-satellite-unstable
    pantheon.pantheon-agent-polkit

    wineWow64Packages.stable
    winetricks
    (callPackage ./derivations/pcsx2.nix { })
    ppsspp-sdl-wayland
    melonDS
    azahar
    mgba
    sameboy

    unrar
    p7zip

    swaybg
    swww
    swayidle
    swaylock

    pavucontrol
    playerctl
    jamesdsp
    blueman

    cliphist
    waybar
    rofi
    kitty
    mako

    nemo-with-extensions
    xdg-user-dirs

    kdePackages.kate
    kdePackages.okular

    (writeShellScriptBin "niri-color-picker" ''
    niri msg pick-color | awk '$1 == "Hex:" { printf "%s", $2 }' | wl-copy
    '')
  ];
}
