{
  pkgs,
  inputs,
  ...
}: let
  niriNix = import "${inputs.niri-nix.src}/lib" {
    self = {};
    inherit (pkgs) lib;
    nixpkgs = {
      legacyPackages.${pkgs.stdenv.hostPlatform.system} = pkgs;
    };
  };

  inherit (niriNix) validatedConfigFor mkNiriKDL;
in {
  xdg.config.files = {
    "niri/config.kdl".source = validatedConfigFor pkgs.niri (mkNiriKDL (import ./config {inherit pkgs;}));
    "nsticky/config.toml".source = (pkgs.formats.toml {}).generate "nsticky.toml" {
      sticky.helium = {
        title = "^Picture in picture$";
      };
      sticky.firefox = {
        title = "^Picture-in-Picture$";
      };
    };
  };

  packages = [
    (pkgs.callPackage "${inputs.nsticky.src}/nix/package.nix" {})
  ];
}
