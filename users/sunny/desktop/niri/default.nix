{
  pkgs,
  inputs,
  ...
}: let
  niriNix = import "${inputs.niri-nix}/lib" {
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
  };

  packages = with pkgs; [
    (callPackage "${inputs.niri-float-sticky}/package.nix" {})
    gtklock
    swayidle
    soteria
  ];
}
