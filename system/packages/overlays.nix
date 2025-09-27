{ config, lib, pkgs, inputs, ... }:

{
  nixpkgs.overlays = [
    inputs.niri.overlays.niri
    (import ./overlays/pcsx2-overlay.nix)
  ];
}
