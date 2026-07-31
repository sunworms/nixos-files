{pkgs}: let
  lib = pkgs.lib;

  configs = [
    (import ./bar.nix)
    (import ./idle.nix)
    (import ./lockscreen.nix)
    (import ./plugins.nix)
    (import ./shell.nix)
    (import ./theme.nix)
    (import ./various.nix)
    (import ./widgets.nix {inherit pkgs;})
  ];
in
  lib.foldl' lib.recursiveUpdate {} configs
