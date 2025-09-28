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

    nerd-fonts.d2coding
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji

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
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
    gnome-keyring

    swaybg
    swww
    swayidle
    swaylock

    pavucontrol
    playerctl
    jamesdsp

    imagemagick
    cliphist
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
