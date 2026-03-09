{ ... }:

{
  xdg.config.files = {
    "matugen/config.toml".source = ./matugen.toml;
    "matugen/foot.ini".source = ./foot.ini;
    "matugen/template.lua".source = ./template.lua;
    "matugen/vesktop.css".source = ./vesktop.css;
    "matugen/yazi-theme.toml".source = ./yazi-theme.toml;
    "matugen/zathura-colors".source = ./zathura-colors;
  };
}
