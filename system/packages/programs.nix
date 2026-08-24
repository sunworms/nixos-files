{
  pkgs,
  inputs,
  ...
}: {
  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  programs.seahorse.enable = true;
  services.gnome.gnome-keyring.enable = true;

  programs.dconf.enable = true;

  programs.fuse.userAllowOther = true;

  programs.gpu-screen-recorder.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt
      intel-vaapi-driver
      intel-media-driver
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [
      intel-media-driver
      intel-vaapi-driver
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
    alejandra

    # pins
    nvfetcher

    (pkgs.callPackage (inputs.agenix.src + "/pkgs/agenix.nix") {})
    fastfetch
    wl-clipboard
  ];

  environment.pathsToLink = [
    "/share/xdg-desktop-portal"
    "/share/applications"
    "/share/fish"
  ];

  environment.etc."chromium/policies/managed/default.json".source = (pkgs.formats.json {}).generate "chromium.json" (import ./chromium.nix);
}
