{ config, lib, pkgs, ... }:

{
  imports = [
    ./overlays.nix
    ./audio.nix
    ./bluetooth.nix
    ./desktop.nix
    ./swaylock.nix
  ];

  nixpkgs.config.allowUnfree = true;

  programs.git.enable = true;

  services.gvfs = {
    enable = true;
    package = pkgs.gvfs;
  };

  environment.systemPackages = with pkgs; [
    nh
    fastfetch
    hyfetch
    brightnessctl
    wl-clipboard
  ];

  environment.pathsToLink = [ "/share/xdg-desktop-portal" "/share/applications" ];
}
