{ ... }:

{
  xdg.config.files = {
    "matugen/config.toml".source = ./matugen.toml;
    "matugen/template.lua".source = ./template.lua;
    "matugen/spicetify.ini".source = ./spicetify.ini;
    "matugen/zathura-colors".source = ./zathura-colors;
  };
}
