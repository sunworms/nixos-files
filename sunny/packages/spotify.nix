{ config, lib, pkgs, ... }:
let
  sources = import ../../npins;
  flake-compat = import sources.flake-compat;
  spicetify-nix = flake-compat { src = sources.spicetify-nix; };
  spicePkgs = spicetify-nix.defaultNix.legacyPackages.${pkgs.stdenv.system};
in
{
  programs.spicetify = {
     enable = true;
     enabledExtensions = with spicePkgs.extensions; [
       adblock
       seekSong
       goToSong
       copyToClipboard
       savePlaylists
       playNext
       hidePodcasts
       shuffle
     ];
  };
}
