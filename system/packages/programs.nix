{ config, lib, pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./catppuccin.nix
    ./desktop.nix
    ./swaylock.nix
  ];

  programs.git.enable = true;

  hardware.graphics.enable32Bit = true;

  environment.systemPackages = with pkgs; [
    fastfetch
    brightnessctl
    wl-clipboard
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.pathsToLink = [ "/share/xdg-desktop-portal" "/share/applications" ];
}
