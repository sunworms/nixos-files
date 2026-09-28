{
  pkgs,
  lib,
  assets,
  ...
}: {
  imports = [
    ./btop
    ./kitty
    ./fish
    ./niri
    ./mako
    ./fuzzel
    ./clipse
    ./scripts
    ./desktop-files.nix
  ];

  files = {
    ".face".source = "${assets}/ima.jpeg";
  };

  xdg.config.files = {
    "git/config".source = (pkgs.formats.gitIni {}).generate "gitconfig" (import ./gitconfig.nix);
    "hyfetch.json".source = (pkgs.formats.json {}).generate "hyfetch.json" (import ./hyfetch.nix);
    "mimeapps.list".source = (pkgs.formats.ini {}).generate "mimeapps.list" {
      "Default Applications" = (import ./mimeapps.nix {inherit lib;}).defaultApps;
      "Added Associations" = (import ./mimeapps.nix {inherit lib;}).addedApps;
    };
    "zathura/zathurarc".source = ./zathurarc;
    "ironbar".source = ./ironbar;
  };

  packages = with pkgs; [
    hyfetch
    git
    xwayland-satellite
    awww
    ironbar
    playerctl
    brightnessctl
    pwvucontrol
    blueman
    networkmanagerapplet
  ];
}
