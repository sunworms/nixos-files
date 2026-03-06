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

    # Nix LSPs
    nil
    nixd
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

  programs.steam = {
    enable = true;
    extraPackages = with pkgs; [
      gamescope
      volantes-cursors
    ];
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
    protontricks.enable = true;
  };

  programs.tmux = {
    enable = true;
    terminal = "tmux-direct";
  };

  environment.etc."chromium/policies/managed/default.json".source =
    (pkgs.formats.json { }).generate "chromium.json"
      (import ./chromium.nix);
}
