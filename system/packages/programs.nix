{ pkgs, ... }:

let
  sources = import ../../npins;
  flake-compat = import sources.flake-compat;
  niri-flake = flake-compat { src = sources.niri-flake; };
  nur = flake-compat { src = sources.nur; };
in
{
  nixpkgs.overlays = [
    niri-flake.defaultNix.overlays.niri
    nur.defaultNix.overlays.default
  ];
  nixpkgs.config.allowUnfree = true;

  programs = {
    git.enable = true;
    dconf.enable = true;
  };

  services.gvfs = {
    enable = true;
    package = pkgs.gvfs;
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt
      vaapiIntel
      intel-media-driver
    ];
  };

  environment.systemPackages = with pkgs; [
    nh
    nil
    nixd
    npins
    git-crypt
    fastfetch
    hyfetch
    wl-clipboard
    gnome-keyring
  ];

  environment.pathsToLink = [
    "/share/xdg-desktop-portal"
    "/share/applications"
  ];
}
