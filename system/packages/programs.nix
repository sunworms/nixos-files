{ pkgs, inputs, ... }:

{
  nixpkgs.overlays = [
    inputs.niri-flake.overlays.niri
    inputs.nur.overlays.default
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
    age
    nixd
    tree
    sops
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
