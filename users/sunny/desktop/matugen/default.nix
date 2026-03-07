{ pkgs, ... }:

{
  xdg.config.files = {
    "matugen/config.toml".source = ./matugen.toml;
    "matugen/btop.theme".source = ./btop.theme;
    "matugen/foot.ini".source = ./foot.ini;
    "matugen/fuzzel.ini".source = ./fuzzel.ini;
    "matugen/gtk.css".source = ./gtk.css;
    "matugen/mako-colors".source = ./mako-colors;
    "matugen/niri.kdl".source = ./niri.kdl;
    "matugen/template.lua".source = ./template.lua;
    "matugen/vesktop.css".source = ./vesktop.css;
    "matugen/zathura-colors".source = ./zathura-colors;
  };

  packages = with pkgs; [
    matugen
    swww
  ];
}
