{ config, lib, pkgs, inputs, ... }:

{
  nixpkgs.overlays = [
    (import ./pcsx2/pcsx2-overlay.nix)
    inputs.niri.overlays.niri
    (import ./mpv/mpv-overlay.nix)
  ];
}
