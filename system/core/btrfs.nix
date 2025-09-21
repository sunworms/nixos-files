{ config, lib, pkgs, ... }:

{
  fileSystems = {
    "/".options = [ "compress=zstd:5" ];
  };
}
