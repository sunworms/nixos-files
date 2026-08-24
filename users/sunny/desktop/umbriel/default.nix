{
  lib,
  pkgs,
  ...
}: {
  xdg.config.files."umbriel/config.toml".source = (pkgs.formats.toml {}).generate "umbriel.toml" (import ./config {inherit lib;});
}
