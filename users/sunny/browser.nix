{ pkgs, sources, ... }:
{
  packages = [
    (pkgs.callPackage ./helium.nix { inherit sources; })
  ];
}
