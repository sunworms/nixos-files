{lib}: let
  configs = [
    (import ./startup.nix)
    (import ./effects.nix)
    (import ./anim.nix)
    (import ./layouts.nix)
    (import ./overview.nix)
    (import ./misc.nix)
    (import ./input.nix)
    (import ./rules.nix)
    (import ./env.nix)
    (import ./keybinds.nix)
    (import ./otherbinds.nix)
    (import ./source.nix)
  ];
in
  lib.foldl' lib.recursiveUpdate {} configs
