{ pkgs, ... }:

{
  packages = [
    (pkgs.callPackage ./helium.nix { })
  ];
}
