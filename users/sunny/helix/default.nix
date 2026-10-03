{
  pkgs,
  sources,
  assets,
  ...
}: {
  packages = [(pkgs.callPackage ./package.nix {inherit sources assets;})];

  xdg.config.files = {
    "helix/config.toml".source = ./config.toml;
    "helix/languages.toml".source = ./languages.toml;
  };
}
