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

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.fuse.userAllowOther = true;

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
    gsettings-desktop-schemas

    # Nix LSPs
    nil
    nixd
    alejandra

    # pins
    nvfetcher

    (callPackage "${inputs.agenix.src}/pkgs/agenix.nix" {})
    fastfetch
    wl-clipboard
  ];

  environment.sessionVariables = {
    GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
  };

  environment.pathsToLink = [
    "/share/xdg-desktop-portal"
    "/share/applications"
    "/share/fish"
    "/share/gsettings-schemas"
  ];
}
