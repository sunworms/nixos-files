{
  pkgs,
  inputs,
  ...
}: let
  inherit (inputs.niri-nix.lib) validatedConfigFor mkNiriKDL;
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
