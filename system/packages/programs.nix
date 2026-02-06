{ pkgs, ... }:

{
  programs.git.enable = true;

  programs.dconf.enable = true;

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

    # Nix LSPs
    nil
    nixd

    # GSettings
    glib

    nvfetcher
    fastfetch
    wl-clipboard
  ];

  environment.pathsToLink = [
    "/share/xdg-desktop-portal"
    "/share/applications"
    "/share/fish"
  ];

  programs.steam = {
    enable = true;
    extraPackages = with pkgs; [
      gamescope
    ];
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
    protontricks.enable = true;
  };

  environment.etc."chromium/policies/managed/default.json".source = ./chromium.json;
}
