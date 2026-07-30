{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./kitty
    ./fish
    ./niri
    ./noctalia
  ];

  files = {
    ".face".source = ../../../assets/icons/face;
  };

  xdg.config.files = {
    "git/config".source = (pkgs.formats.gitIni {}).generate "gitconfig" (import ./gitconfig.nix);
    "hyfetch.json".source = (pkgs.formats.json {}).generate "hyfetch.json" (import ./hyfetch.nix);
    "mimeapps.list".source = (pkgs.formats.ini {}).generate "mimeapps.list" {
      "Default Applications" = (import ./mimeapps.nix {inherit lib;}).defaultApps;
      "Added Associations" = (import ./mimeapps.nix {inherit lib;}).addedApps;
    };
  };

  packages = with pkgs; [
    hyfetch
    git
    xwayland-satellite
  ];
}
