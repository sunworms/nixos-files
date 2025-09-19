{ config, lib, pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./catppuccin.nix
    ./desktop.nix
    ./virtualbox.nix
    ./swaylock.nix
  ];

  programs.git.enable = true;

  services.gvfs = {
    enable = true;
    package = pkgs.gvfs;
  };

  environment.systemPackages = with pkgs; [
    fastfetch
    hyfetch
    brightnessctl
    wl-clipboard
  ];

  environment.pathsToLink = [ "/share/xdg-desktop-portal" "/share/applications" ];
}
