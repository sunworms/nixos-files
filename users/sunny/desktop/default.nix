{pkgs, ...}: {
  imports = [
    ./btop
    ./foot
    ./fish
    ./niri
    ./matugen
    ./waybar
    ./fuzzel
    ./swaync
  ];

  files = {
    ".face".source = ../../../assets/icons/face;
  };

  xdg.config.files = {
    "git/config".source = ./gitconfig;
    "hyfetch.json".source = ./hyfetch.json;
    "mimeapps.list".source = ./mimeapps.list;
  };

  packages = with pkgs; [
    hyfetch
    git
    xwayland-satellite
    nautilus
    awww
    playerctl
    brightnessctl
  ];
}
