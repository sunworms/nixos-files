{lib}: let
  configs = [
    (import ./bar.nix)
    (import ./idle.nix)
    (import ./lockscreen.nix)
    (import ./plugins.nix)
    (import ./shell.nix)
    (import ./theme.nix)
    (import ./various.nix)
    (import ./widgets.nix)
  ];
in
  lib.foldl' lib.recursiveUpdate {} configs
