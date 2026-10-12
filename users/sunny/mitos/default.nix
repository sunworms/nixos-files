{
  pkgs,
  inputs,
  assets,
  ...
}: {
  packages = [(pkgs.callPackage ./package.nix {inherit inputs assets;})];

  xdg.config.files = {
    "mitos/config.toml".source = (pkgs.formats.toml {}).generate "mitos-config.toml" (import ./config.nix);
    "mitos/languages.toml".source = (pkgs.formats.toml {}).generate "mitos-languages.toml" (import ./languages.nix);
  };
}
