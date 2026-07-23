{
  pkgs,
  inputs,
  ...
}: {
  xdg.config.files = {
    "niri/config.kdl".source = ./config.kdl;
  };

  packages = [
    (pkgs.callPackage "${inputs.niri-float-sticky}/package.nix" {})
  ];
}
