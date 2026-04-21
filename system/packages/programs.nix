{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  programs.dconf.enable = true;

  programs.fuse.userAllowOther = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt
      intel-vaapi-driver
      intel-media-driver
    ];
  };

  environment.systemPackages = with pkgs; [
    nh
    tree
    ncdu

    # glib
    glib

    # Nix LSPs
    nil
    nixd
    nixfmt

    # nvfetcher
    nvfetcher

    fastfetch
    wl-clipboard

    # xwayland theming
    xsettingsd
    xrdb
  ];

  environment.pathsToLink = [
    "/share/xdg-desktop-portal"
    "/share/applications"
    "/share/fish"
  ];
}
