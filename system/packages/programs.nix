{ pkgs, ... }:

let
  fixedPrefetchGit = pkgs.runCommand "nix-prefetch-git-fixed" { } ''
    mkdir -p $out/bin
    ln -s ${pkgs.nix-prefetch-git}/bin/nix-prefetch-git* $out/bin/nix-prefetch-git
  '';
in
{
  programs.git = {
    enable = true;
    lfs.enable = true;
  };

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

    # glib
    glib

    # Nix LSPs
    nil
    nixd
    nixfmt
    tree-sitter

    # nvfetcher
    nvfetcher
    fixedPrefetchGit

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

  environment.etc."chromium/policies/managed/default.json".source =
    (pkgs.formats.json { }).generate "chromium.json"
      (import ./chromium.nix);
}
