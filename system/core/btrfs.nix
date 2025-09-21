{ config, lib, pkgs, ... }:

{
  fileSystems = {
    "/".options = [ "compress=zstd:5" ];
    "/nix/store".options = [ "compress=zstd:5" ];
  };
}
