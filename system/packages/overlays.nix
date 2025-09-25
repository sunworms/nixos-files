{ config, lib, pkgs, inputs, ... }:

{
  nixpkgs.overlays = [
    inputs.niri.overlays.niri
    (import ./overlays/mpv-overlay.nix)
    (import ./overlays/pcsx2-overlay.nix)
    (import ./overlays/yt-dlp-overlay.nix)
  ];
}
