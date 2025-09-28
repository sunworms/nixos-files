{ config, lib, pkgs, ... }:

{
  files = {
    ".config/mako/config".text = ''
    background-color=#212121
    border-color=#383838
    border-size=1
    default-timeout=10000
    font=D2CodingLigatureNerdFont 11
    progress-color=over #454545
    text-color=#d8d8d8

    [urgency=high]
    border-color=#b7141e
    '';

    ".config/swaylock/config".text = ''
    daemonize
    ignore-empty-password
    image=$HOME/Pictures/walls/nix-blur.png
    font=D2CodingLigature Nerd Font
    font-size=14
    color=161616
    bs-hl-color=42be65
    caps-lock-bs-hl-color=ffc726
    caps-lock-key-hl-color=ffc726
    inside-color=00000000
    inside-clear-color=00000000
    inside-caps-lock-color=00000000
    inside-ver-color=00000000
    inside-wrong-color=00000000
    key-hl-color=42be65
    layout-bg-color=00000000
    layout-border-color=00000000
    layout-text-color=f2f4f8
    line-color=00000000
    line-clear-color=00000000
    line-caps-lock-color=00000000
    line-ver-color=00000000
    line-wrong-color=00000000
    ring-color=393939
    ring-clear-color=42be65
    ring-caps-lock-color=ffc726
    ring-ver-color=33b1ff
    ring-wrong-color=ff7eb6
    separator-color=00000000
    text-color=f2f4f8
    text-clear-color=42be65
    text-caps-lock-color=ffc726
    text-ver-color=ffc726
    text-wrong-color=ff7eb6
    '';
  };
}
