{ ... }:

{
  xdg.config.files = {
    "helix/config.toml".source = ./config.toml;
    "helix/labguages.toml".source = ./languages.toml;
  };
}
