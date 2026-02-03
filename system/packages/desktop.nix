{ pkgs, sources, ... }:

{
  programs.niri.enable = true;

  programs.dms-shell = {
    enable = true;
    systemd.enable = false;
    quickshell.package = (pkgs.callPackage "${sources.quickshell.src}/default.nix" {});
  };
}
