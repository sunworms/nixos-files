{
  pkgs,
  inputs,
  ...
}: {
  xdg.config.files = {
    "niri/config.kdl".source = ./config.kdl;
  };

  packages = [
    inputs.niri-float-sticky.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
