{ config, lib, pkgs, ... }:

{
  nixpkgs.overlays = [
    (import ./overlays/pcsx2-overlay.nix)
  ];
}
