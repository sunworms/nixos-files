{ config, lib, pkgs, ... }:

{
  virtualisation.virtualbox.host = {
    enable = true;
    enableKvm = true;
    enableHardening = false;
    addNetworkInterface = false;
  };
}
