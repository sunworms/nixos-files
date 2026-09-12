{
  lib,
  assets,
}: let
  configs = [
    (import ./bar.nix)
    (import ./idle.nix)
    (import ./lockscreen.nix)
    (import ./plugins.nix)
    (import ./shell.nix)
    (import ./theme.nix)
    (import ./various.nix)
    (import ./widgets.nix {inherit assets;})
  ];
in
  lib.foldl' lib.recursiveUpdate {} configs
