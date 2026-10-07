{
  pkgs,
  inputs,
  assets,
  ...
}: {
  packages = [(pkgs.callPackage ./package.nix {inherit inputs assets;})];

  xdg.config.files = {
    "helix/config.toml".source = (pkgs.formats.toml {}).generate "helix-config.toml" (import ./config.nix);
    "helix/languages.toml".source = (pkgs.formats.toml {}).generate "helix-languages.toml" (import ./languages.nix);
  };
}
