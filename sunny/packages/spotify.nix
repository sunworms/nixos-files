{ config, lib, pkgs, ... }:

let
  sources = import ../../npins;
  pkgs = import sources.nixpkgs {
    system = "x86_64-linux";
  };
  flake-compat = import sources.flake-compat;
  spicetify-nix = flake-compat { src = sources.spicetify-nix; };
  spicePkgs = spicetify-nix.defaultNix.legacyPackages.${pkgs.stdenv.system};
in
{
  stylix.targets.spicetify.enable = false;
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      autoSkipVideo
      adblock
      hidePodcasts
      shuffle
      seekSong
      goToSong
      songStats
      copyToClipboard
      savePlaylists
      playNext
    ];
    theme = spicePkgs.themes.comfy;
    colorScheme = "Everforest";
  };
}
