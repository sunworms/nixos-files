{ pkgs, inputs, ... }:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
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
