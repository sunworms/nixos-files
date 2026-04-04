{ inputs, pkgs, ... }:

{
  xdg.config.files = {
    "helix/config.toml".source = ./config.toml;
    "helix/languages.toml".source = ./languages.toml;
  };

  packages = [
    inputs.helix.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
