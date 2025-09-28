{ config, lib, pkgs, ... }:

{
  packages = with pkgs; [
    (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
    blueman

    xwayland-satellite-unstable
    pantheon.pantheon-agent-polkit

    wineWow64Packages.stable
    winetricks
    pcsx2
    ppsspp-sdl-wayland
    melonDS
    azahar
    mgba
    sameboy

    unrar
    p7zip

    firefox

    swaybg
    swww
    swayidle
    swaylock

    pavucontrol
    playerctl
    jamesdsp

    imagemagick
    cliphist
    waybar
    fuzzel
    kitty
    mako

    nemo
    file-roller
    nemo-fileroller
    xdg-user-dirs

    kdePackages.kate
    kdePackages.okular

    (writeShellScriptBin "niri-color-picker" ''
    niri msg pick-color | awk '$1 == "Hex:" { printf "%s", $2 }' | wl-copy
    '')
  ];
}
