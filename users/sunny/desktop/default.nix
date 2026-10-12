{
  pkgs,
  lib,
  assets,
  ...
}: {
  imports = [
    ./btop
    ./foot
    ./fish
    ./niri
    ./fuzzel
    ./clipse
    ./waybar
    ./wal
    ./mako
    ./scripts
    ./browser
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
    "lazygit/config.yml".source = (pkgs.formats.yaml {}).generate "lazygit.yml" {
      os = {
        edit = "ms {{filename}}";
        editAtLine = "ms {{filename}}:{{line}}";
      };
    };
  };

  packages = with pkgs; [
    hyfetch
    git
    xwayland-satellite
    lazygit
    awww
    playerctl
    brightnessctl
    pwvucontrol
    blueman
    networkmanagerapplet
  ];
}
