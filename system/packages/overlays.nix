{ config, lib, pkgs, inputs, ... }:

{
  nixpkgs.overlays = [
    inputs.niri.overlays.niri
  ];
}
