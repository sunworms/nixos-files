{pkgs}: let
  lib = pkgs.lib;

  configs = [
    (import ./environment.nix)
    (import ./input.nix)
    (import ./layer-rules.nix)
    (import ./layout.nix)
    (import ./misc.nix)
    (import ./other-binds.nix)
    (import ./startup.nix)
    (import ./user-binds.nix)
    (import ./window-rules.nix)
  ];
in
  lib.foldl' lib.recursiveUpdate {} configs
