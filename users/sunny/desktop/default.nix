{ pkgs, ... }:

{
  imports = [
    ./foot
    ./fish
    ./niri
    ./noctalia
  ];

  files = {
    ".icons/default/index.theme".text = ''
      [Icon Theme]
      Name=Default
      Comment=Default Cursor Theme
      Inherits=volantes_cursors
    '';

    ".Xresources".text = ''
      Xcursor.theme:  volantes_cursors
      Xcursor.size:   24
    '';

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
  ];
}
