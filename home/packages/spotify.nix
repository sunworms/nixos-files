{ config, lib, pkgs, inputs, ... }:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      autoSkipVideo
      seekSong
      playNext
      adblock
      hidePodcasts
      shuffle
    ];
    theme = spicePkgs.themes.fluent;
    colorScheme = "dark";
  };
}
