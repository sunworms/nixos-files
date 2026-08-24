{lib}: let
  configs = [
    (import ./appearance.nix)
    (import ./env.nix)
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
