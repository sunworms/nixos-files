{ ... }:

{
  xdg.config.files = {
    "matugen/config.toml".source = ./matugen.toml;
    "matugen/template.lua".source = ./template.lua;
    "matugen/vesktop.css".source = ./vesktop.css;
    "matugen/zathura-colors".source = ./zathura-colors;
  };
}
