{ config, lib, pkgs, ... }:

{
  imports = [
    ./overlays.nix
    ./audio.nix
    ./bluetooth.nix
    ./desktop.nix
    ./swaylock.nix
    ./fonts.nix
    ./portals.nix
  ];

  nixpkgs.config.allowUnfree = true;

  programs.git.enable = true;
  programs.gpu-screen-recorder.enable = true;

  services.gvfs = {
    enable = true;
    package = pkgs.gvfs;
  };

  environment.systemPackages = with pkgs; [
    nh
    libnotify
    fastfetch
    hyfetch
    brightnessctl
    wl-clipboard
    gnome-keyring
  ];

  environment.pathsToLink = [ "/share/xdg-desktop-portal" "/share/applications" ];
}
