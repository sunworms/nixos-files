{ config, lib, pkgs, ... }:

{
  fileSystems = {
    "/".options = [ "compress-force=zstd:5" ];
  };

  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };
}
