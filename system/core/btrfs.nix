{ config, lib, pkgs, ... }:

{
  fileSystems = {
    "/".options = [ "compress-force=zstd:5" ];
  };
}
