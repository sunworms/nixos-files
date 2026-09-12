{pkgs}: let
  lib = pkgs.lib;

  configs = [
    (import ./appearance.nix)
    (import ./env.nix {inherit pkgs;})
    (import ./general.nix)
    (import ./input.nix)
    (import ./layout.nix)
    (import ./misc.nix)
    (import ./other-binds.nix)
    (import ./user-binds.nix)
    (import ./window-rules.nix)
  ];
in
  lib.foldl' lib.recursiveUpdate {} configs
